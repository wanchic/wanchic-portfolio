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
end
