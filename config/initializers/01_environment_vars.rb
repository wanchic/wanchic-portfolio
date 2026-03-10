
# Assign DOCKER PG Environment unless already assigned.
ENV["PG_HOST"]     ||= ENV.fetch("DOCKER_PG_HOST", "localhost")
ENV["PG_PORT"]     ||= ENV.fetch("DOCKER_PG_PORT", "5432")
ENV["PG_USER"]     ||= ENV.fetch("DOCKER_PG_USER", "postgres")
ENV["PG_PASSWORD"] ||= ENV.fetch("DOCKER_PG_PASSWORD", "postgres")

pg_database = ENV.fetch("DOCKER_PG_DATABASE", "portfolio")
ENV["PG_DATABASE_DEV"]   ||= ENV.fetch("DOCKER_PG_DATABASE_DEV", pg_database)
ENV["PG_DATABASE_TEST"]  ||= ENV.fetch("DOCKER_PG_DATABASE_TEST", "#{pg_database}_test")
ENV["PG_DATABASE_PRO"]   ||= ENV.fetch("DOCKER_PG_DATABASE_PRO", pg_database)
ENV["PG_DATABASE_CACHE"] ||= ENV.fetch("DOCKER_PG_DATABASE_CACHE", "#{pg_database}_cache")
ENV["PG_DATABASE_QUEUE"] ||= ENV.fetch("DOCKER_PG_DATABASE_QUEUE", "#{pg_database}_queue")
ENV["PG_DATABASE_CABLE"] ||= ENV.fetch("DOCKER_PG_DATABASE_CABLE", "#{pg_database}_cable")
