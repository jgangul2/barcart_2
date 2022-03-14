require 'rails_helper'

RSpec.describe "cocktail_favorites_users#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cocktail_favorites_users/#{cocktail_favorites_user.id}"
  end

  describe 'basic destroy' do
    let!(:cocktail_favorites_user) { create(:cocktail_favorites_user) }

    it 'updates the resource' do
      expect(CocktailFavoritesUserResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CocktailFavoritesUser.count }.by(-1)
      expect { cocktail_favorites_user.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
