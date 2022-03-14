require "rails_helper"

RSpec.describe "cocktail_recipes_standards#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cocktail_recipes_standards/#{cocktail_recipes_standard.id}"
  end

  describe "basic destroy" do
    let!(:cocktail_recipes_standard) { create(:cocktail_recipes_standard) }

    it "updates the resource" do
      expect(CocktailRecipesStandardResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { CocktailRecipesStandard.count }.by(-1)
      expect { cocktail_recipes_standard.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
