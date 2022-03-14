require "rails_helper"

RSpec.describe "cocktail_favorites_users#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cocktail_favorites_users/#{cocktail_favorites_user.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:cocktail_favorites_user) { create(:cocktail_favorites_user) }

    it "works" do
      expect(CocktailFavoritesUserResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("cocktail_favorites_users")
      expect(d.id).to eq(cocktail_favorites_user.id)
    end
  end
end
