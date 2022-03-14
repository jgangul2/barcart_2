require 'rails_helper'

RSpec.describe "user_customized_cocktails#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/user_customized_cocktails/#{user_customized_cocktail.id}"
  end

  describe 'basic destroy' do
    let!(:user_customized_cocktail) { create(:user_customized_cocktail) }

    it 'updates the resource' do
      expect(UserCustomizedCocktailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { UserCustomizedCocktail.count }.by(-1)
      expect { user_customized_cocktail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
