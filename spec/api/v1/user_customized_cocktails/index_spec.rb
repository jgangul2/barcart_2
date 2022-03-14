require 'rails_helper'

RSpec.describe "user_customized_cocktails#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/user_customized_cocktails", params: params
  end

  describe 'basic fetch' do
    let!(:user_customized_cocktail1) { create(:user_customized_cocktail) }
    let!(:user_customized_cocktail2) { create(:user_customized_cocktail) }

    it 'works' do
      expect(UserCustomizedCocktailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['user_customized_cocktails'])
      expect(d.map(&:id)).to match_array([user_customized_cocktail1.id, user_customized_cocktail2.id])
    end
  end
end
