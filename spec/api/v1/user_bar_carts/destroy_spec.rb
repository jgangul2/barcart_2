require "rails_helper"

RSpec.describe "user_bar_carts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_bar_carts/#{user_bar_cart.id}"
  end

  describe "basic destroy" do
    let!(:user_bar_cart) { create(:user_bar_cart) }

    it "updates the resource" do
      expect(UserBarCartResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UserBarCart.count }.by(-1)
      expect { user_bar_cart.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
