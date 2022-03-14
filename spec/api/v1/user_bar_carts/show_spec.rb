require "rails_helper"

RSpec.describe "user_bar_carts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_bar_carts/#{user_bar_cart.id}", params: params
  end

  describe "basic fetch" do
    let!(:user_bar_cart) { create(:user_bar_cart) }

    it "works" do
      expect(UserBarCartResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("user_bar_carts")
      expect(d.id).to eq(user_bar_cart.id)
    end
  end
end
