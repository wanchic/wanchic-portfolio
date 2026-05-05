return if Rails.env.test?

require "opentelemetry/sdk"
require "opentelemetry/exporter/otlp"
require "opentelemetry/instrumentation/all"

OpenTelemetry::SDK.configure do |c|
  c.service_name = "wanchic-portfolio"
  c.service_version = WanchicPortfolio::Application::VERSION

  c.use_all
end
