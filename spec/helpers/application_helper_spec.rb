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
end
