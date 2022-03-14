require "rails_helper"

RSpec.describe "cocktail_recipes_standards#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cocktail_recipes_standards", params: params
  end

  describe "basic fetch" do
    let!(:cocktail_recipes_standard1) { create(:cocktail_recipes_standard) }
    let!(:cocktail_recipes_standard2) { create(:cocktail_recipes_standard) }

    it "works" do
      expect(CocktailRecipesStandardResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["cocktail_recipes_standards"])
      expect(d.map(&:id)).to match_array([cocktail_recipes_standard1.id,
                                          cocktail_recipes_standard2.id])
    end
  end
end
