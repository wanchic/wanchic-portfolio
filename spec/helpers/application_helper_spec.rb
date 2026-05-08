# spec/helpers/application_helper_spec.rb
require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#div_break" do
    it "returns a div containing a br tag" do
      expect(helper.div_break).to eq("<div><br></div>")
    end
  end

  describe "#app_versions_footer" do
    it "renders the app versions in a div" do
      html = helper.app_versions_footer

      expect(html).to include("Ruby: ")
      expect(html).to include("Rails: ")
      expect(html).to include("App: ")
      expect(html).to include(helper.ruby_version)
      expect(html).to include(Rails::VERSION::STRING)
      expect(html).to include(WanchicPortfolio::Application::VERSION)
    end
  end

  describe "#app_versions" do
    it "returns the Ruby, Rails, and App versions" do
      expect(helper.app_versions).to eq(
        "Ruby" => helper.ruby_version,
        "Rails" => Rails::VERSION::STRING,
        "App" => WanchicPortfolio::Application::VERSION
      )
    end
  end

  describe "#app_host" do
    before do
      allow(ENV).to receive(:fetch).and_call_original
    end

    it "returns the current APP_HOST if defined" do
      ENV["APP_HOST"] = "local-Host"
      expect(helper.app_host).to eq("local-Host")
    end

    it "returns the default value if APP_HOST is not defined" do
      ENV["APP_HOST"] = nil
      expect(helper.app_host).to eq("GitHub Pages")
    end
  end

  describe "#app_versionn" do
    it "returns the current defined app version string" do
      stub_const("WanchicPortfolio::Application::VERSION", "1.2.3c")
      expect(helper.app_version).to eq("1.2.3c")
    end
  end

  describe "#ruby_version" do
    it "returns the current Ruby version string" do
      expected = "#{RUBY_VERSION}#{"p#{RUBY_PATCHLEVEL}" unless RUBY_PATCHLEVEL.zero?}"
      expect(helper.ruby_version).to eq(expected)
    end

    it "includes the patchlevel when RUBY_PATCHLEVEL is not zero" do
      stub_const("RUBY_VERSION", "4.0.1")
      stub_const("RUBY_PATCHLEVEL", 12)

      expect(helper.ruby_version).to eq("4.0.1p12")
    end

    it "does not include the patchlevel when RUBY_PATCHLEVEL is zero" do
      stub_const("RUBY_VERSION", "4.0.1")
      stub_const("RUBY_PATCHLEVEL", 0)

      expect(helper.ruby_version).to eq("4.0.1")
    end
  end

  describe "#rails_version" do
    it "returns the current Rails version string" do
      stub_const("Rails::VERSION::STRING", "9.9.9")
      expect(helper.rails_version).to eq("9.9.9")
    end
  end
end
