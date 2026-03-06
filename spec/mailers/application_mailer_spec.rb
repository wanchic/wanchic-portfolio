require "rails_helper"

RSpec.describe ApplicationMailer, type: :mailer do
  describe "inheritance" do
    it "inherits from ActionMailer::Base" do
      expect(described_class < ActionMailer::Base).to be(true)
    end
  end

  describe "defaults" do
    it "sets the default from address" do
      expect(described_class.default[:from]).to eq("from@example.com")
    end
  end

  describe "layout" do
    it "uses the mailer layout" do
      expect(described_class._layout).to eq("mailer")
    end
  end
end
