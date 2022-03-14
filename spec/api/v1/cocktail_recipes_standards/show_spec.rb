require 'rails_helper'

RSpec.describe "cocktail_recipes_standards#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cocktail_recipes_standards/#{cocktail_recipes_standard.id}", params: params
  end

  describe 'basic fetch' do
    let!(:cocktail_recipes_standard) { create(:cocktail_recipes_standard) }

    it 'works' do
      expect(CocktailRecipesStandardResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('cocktail_recipes_standards')
      expect(d.id).to eq(cocktail_recipes_standard.id)
    end
  end
end
