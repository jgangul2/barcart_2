require "rails_helper"

RSpec.describe "cocktail_recipes_standards#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cocktail_recipes_standards/#{cocktail_recipes_standard.id}",
                payload
  end

  describe "basic update" do
    let!(:cocktail_recipes_standard) { create(:cocktail_recipes_standard) }

    let(:payload) do
      {
        data: {
          id: cocktail_recipes_standard.id.to_s,
          type: "cocktail_recipes_standards",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CocktailRecipesStandardResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { cocktail_recipes_standard.reload.attributes }
    end
  end
end
