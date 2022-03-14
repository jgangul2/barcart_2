require "rails_helper"

RSpec.describe "cocktail_details#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cocktail_details/#{cocktail_detail.id}", params: params
  end

  describe "basic fetch" do
    let!(:cocktail_detail) { create(:cocktail_detail) }

    it "works" do
      expect(CocktailDetailResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("cocktail_details")
      expect(d.id).to eq(cocktail_detail.id)
    end
  end
end
