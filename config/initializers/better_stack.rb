if Rails.env.production?
  if ENV.fetch("BETTER_STACK_SOURCE_TOKEN", nil).present?
    Rails.logger = Logtail::Logger.create_default_logger(
      source_token: ENV.fetch("BETTER_STACK_SOURCE_TOKEN", nil)
    )
  else
    Rails.logger.info "Better Stack disabled: BETTER_STACK_SOURCE_TOKEN is not set"
  end
end
