# spec/helpers/home_helper_spec.rb
require "rails_helper"

RSpec.describe HomeHelper, type: :helper do
  describe "#copyright_footer" do
    it "renders the copyright text with year span and name" do
      html = helper.copyright_footer(name: "Eric Wanchic")

      expect(html).to include("©")
      expect(html).to include('<span id="y"></span>')
      expect(html).to include("Eric Wanchic")

      expect(html).not_to include("Hosted on")
      expect(html).not_to include("•")
    end

    it "renders the host text when host is present" do
      html = helper.copyright_footer(host: "GitHub Pages")

      expect(html).not_to include("©")
      expect(html).not_to include('<span id="y"></span>')
      expect(html).to include("Hosted on GitHub Pages")
      expect(html).not_to include("•")
    end

    it "renders the host & copyright text when name & host is present" do
      html = helper.copyright_footer(name: "Eric Wanchic", host: "GitHub Pages")

      expect(html).to include("©")
      expect(html).to include('<span id="y"></span>')
      expect(html).to include("Eric Wanchic")
      expect(html).to include("Hosted on GitHub Pages")
      expect(html).to include("•")
    end

    it "does not render host text when host is nil" do
      html = helper.copyright_footer(name: "Eric Wanchic", host: nil)

      expect(html).not_to include("Hosted on")
      expect(html).not_to include("•")
    end

    it "does not render host text when host is blank" do
      html = helper.copyright_footer(name: "Eric Wanchic", host: "")

      expect(html).not_to include("Hosted on")
      expect(html).not_to include("•")
    end

    it "does not render host text when name is nil" do
      html = helper.copyright_footer(name: nil, host: "GitHub Pages")

      expect(html).not_to include("©")
      expect(html).not_to include('<span id="y"></span>')
      expect(html).not_to include("•")
    end

    it "does not render host text when name is blank" do
      html = helper.copyright_footer(name: "", host: "GitHub Pages")

      expect(html).not_to include("©")
      expect(html).not_to include('<span id="y"></span>')
      expect(html).not_to include("•")
    end

    it "returns nil when name & host are not present" do
      html = helper.copyright_footer

      expect(html).to be(nil)
    end
  end

  describe "#footer_data" do
    before do
      allow(ENV).to receive(:fetch).and_call_original
      ENV["APP_HOST"] = "Local Environment"
    end

    it "provides the website author" do
      expect(helper.footer_data[:name]).to eq("Eric Wanchic")
    end

    it "provides the website host" do
      expect(helper.footer_data[:host]).to eq("Local Environment")
    end

    it "provides the ruby version" do
      expect(helper.footer_data[:ruby]).to eq(helper.ruby_version)
    end

    it "provides the rails version" do
      expect(helper.footer_data[:rails]).to eq(Rails::VERSION::STRING)
    end

    it "provides the app version" do
      expect(helper.footer_data[:app]).to eq(WanchicPortfolio::Application::VERSION)
    end
  end
end
