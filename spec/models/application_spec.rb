require "rails_helper"

RSpec.describe ApplicationRecord, type: :model do
  describe "inheritance" do
    it "inherits from ActiveRecord::Base" do
      expect(described_class < ActiveRecord::Base).to be(true)
    end
  end

  describe "abstract class" do
    it "is an abstract class" do
      expect(described_class.abstract_class).to be(true)
    end
  end
end
