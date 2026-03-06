module ApplicationHelper
  def div_break
    content_tag(:div) do
      "<br>".html_safe
    end
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

  def ruby_version
    "#{RUBY_VERSION}#{"p#{RUBY_PATCHLEVEL}" unless RUBY_PATCHLEVEL.zero?}"
  end
end
