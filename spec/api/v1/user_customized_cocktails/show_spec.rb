require 'rails_helper'

RSpec.describe "user_customized_cocktails#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_customized_cocktails/#{user_customized_cocktail.id}", params: params
  end

  describe 'basic fetch' do
    let!(:user_customized_cocktail) { create(:user_customized_cocktail) }

    it 'works' do
      expect(UserCustomizedCocktailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('user_customized_cocktails')
      expect(d.id).to eq(user_customized_cocktail.id)
    end
  end
end
