require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  controller do
    def index
      render plain: "ok"
    end
  end

  def payload_after_append
    {}.tap do |payload|
      subject.send(:append_info_to_payload, payload)
    end
  end

  describe "with a current_user" do
    controller do
      def current_user
        nil
      end
    end

    before do
      allow(subject).to receive(:current_user).and_return(double(id: 123))
    end

    it "adds current_user_id when current_user exists" do
      expect(payload_after_append[:current_user_id]).to eq(123)
    end
  end
  describe "without a current_user" do
    it "does not add current_user_id when current_user is not defined" do
      expect(payload_after_append).not_to have_key(:current_user_id)
    end
  end
end
