if Rails.env.production?
  Rails.logger = Logtail::Logger.create_default_logger(
    source_token: ENV.fetch("BETTER_STACK_SOURCE_TOKEN")
  )
end
