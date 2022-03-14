require 'rails_helper'

RSpec.describe "cocktail_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/cocktail_details/#{cocktail_detail.id}"
  end

  describe 'basic destroy' do
    let!(:cocktail_detail) { create(:cocktail_detail) }

    it 'updates the resource' do
      expect(CocktailDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { CocktailDetail.count }.by(-1)
      expect { cocktail_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
