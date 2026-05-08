module ApplicationHelper
  def div_break
    content_tag(:div, tag.br)
  end

  def app_versions_footer
    content_tag(:div) do
      safe_join(
        app_versions.map {
          |k, v| safe_join([ "#{k}: ", content_tag(:span, v) ])
        }, " • "
      )
    end
  end

  def app_versions
    {
      "Ruby" => ruby_version,
      "Rails" => Rails::VERSION::STRING,
      "App" => WanchicPortfolio::Application::VERSION
    }
  end

  def app_host
    ENV.fetch("APP_HOST", "GitHub Pages")
  end

  def app_version
    WanchicPortfolio::Application::VERSION
  end

  def ruby_version
    return RUBY_VERSION if RUBY_PATCHLEVEL.zero?
    "#{RUBY_VERSION}p#{RUBY_PATCHLEVEL}"
  end

  def rails_version
    Rails::VERSION::STRING
  end
end
