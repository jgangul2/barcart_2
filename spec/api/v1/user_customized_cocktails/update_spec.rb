require 'rails_helper'

RSpec.describe "user_customized_cocktails#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/user_customized_cocktails/#{user_customized_cocktail.id}", payload
  end

  describe 'basic update' do
    let!(:user_customized_cocktail) { create(:user_customized_cocktail) }

    let(:payload) do
      {
        data: {
          id: user_customized_cocktail.id.to_s,
          type: 'user_customized_cocktails',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(UserCustomizedCocktailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { user_customized_cocktail.reload.attributes }
    end
  end
end
