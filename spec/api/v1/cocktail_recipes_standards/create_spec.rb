require 'rails_helper'

RSpec.describe "cocktail_recipes_standards#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/cocktail_recipes_standards", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'cocktail_recipes_standards',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CocktailRecipesStandardResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CocktailRecipesStandard.count }.by(1)
    end
  end
end
