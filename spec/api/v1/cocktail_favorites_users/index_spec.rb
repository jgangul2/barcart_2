require "rails_helper"

RSpec.describe "cocktail_favorites_users#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cocktail_favorites_users", params: params
  end

  describe "basic fetch" do
    let!(:cocktail_favorites_user1) { create(:cocktail_favorites_user) }
    let!(:cocktail_favorites_user2) { create(:cocktail_favorites_user) }

    it "works" do
      expect(CocktailFavoritesUserResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["cocktail_favorites_users"])
      expect(d.map(&:id)).to match_array([cocktail_favorites_user1.id,
                                          cocktail_favorites_user2.id])
    end
  end
end
