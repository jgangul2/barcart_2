require "rails_helper"

RSpec.describe "cocktail_favorites_users#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cocktail_favorites_users/#{cocktail_favorites_user.id}",
                payload
  end

  describe "basic update" do
    let!(:cocktail_favorites_user) { create(:cocktail_favorites_user) }

    let(:payload) do
      {
        data: {
          id: cocktail_favorites_user.id.to_s,
          type: "cocktail_favorites_users",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CocktailFavoritesUserResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { cocktail_favorites_user.reload.attributes }
    end
  end
end
