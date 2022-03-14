require "rails_helper"

RSpec.describe "user_bar_carts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_bar_carts", params: params
  end

  describe "basic fetch" do
    let!(:user_bar_cart1) { create(:user_bar_cart) }
    let!(:user_bar_cart2) { create(:user_bar_cart) }

    it "works" do
      expect(UserBarCartResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["user_bar_carts"])
      expect(d.map(&:id)).to match_array([user_bar_cart1.id, user_bar_cart2.id])
    end
  end
end
