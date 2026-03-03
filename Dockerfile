# syntax=docker/dockerfile:1.7
# check=error=true

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:

# docker build -t wanchic_portfolio .
# docker run -d -p 80:80 -e RAILS_MASTER_KEY=<value from config/master.key> --name wanchic_portfolio wanchic_portfolio

# For a containerized dev environment, see Dev Containers: https://guides.rubyonrails.org/getting_started_with_devcontainer.html

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=4.0.1

# These tags will be provided by CI (deps-amd64 / deps-arm64)
ARG DEPS_IMAGE=wanchic/wanchic-portfolio:deps

FROM ${DEPS_IMAGE} AS build
WORKDIR /rails

# Copy application code (this is the “fast changing” part)
COPY . .

RUN --mount=type=cache,target=/rails/tmp,sharing=locked \
    bundle exec bootsnap precompile -j 1 app/ lib/

RUN --mount=type=cache,target=/rails/tmp,sharing=locked \
    SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage: slim runtime
ARG RUBY_VERSION=4.0.1
FROM docker.io/library/ruby:$RUBY_VERSION-slim-trixie AS base

LABEL vendor="Eric Wanchic" \
      com.wanchic.is-production="true"

# Rails app lives here
WORKDIR /rails

# Install base packages
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl=8.14.1-2+deb13u2 \
    libjemalloc2=5.3.0-3 \
    libvips42t64=8.16.1-1+b1 \
    sqlite3=3.46.1-7 && \
    ln -s "/usr/lib/$(uname -m)-linux-gnu/libjemalloc.so.2" \
          /usr/local/lib/libjemalloc.so && \
    rm -rf /var/lib/apt/lists/*

# Set production environment variables and enable jemalloc for reduced memory usage and latency.
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development" \
    LD_PRELOAD="/usr/local/lib/libjemalloc.so"

# Run and own only the runtime files as a non-root user for security
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash
USER 1000:1000

# Copy built artifacts: gems, application
COPY --chown=rails:rails --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --chown=rails:rails --from=build /rails /rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start server via Thruster by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/thrust", "./bin/rails", "server"]
