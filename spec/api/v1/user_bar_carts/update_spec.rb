require "rails_helper"

RSpec.describe "user_bar_carts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_bar_carts/#{user_bar_cart.id}", payload
  end

  describe "basic update" do
    let!(:user_bar_cart) { create(:user_bar_cart) }

    let(:payload) do
      {
        data: {
          id: user_bar_cart.id.to_s,
          type: "user_bar_carts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UserBarCartResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { user_bar_cart.reload.attributes }
    end
  end
end
