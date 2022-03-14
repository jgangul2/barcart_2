require "rails_helper"

RSpec.describe "cocktail_details#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/cocktail_details", params: params
  end

  describe "basic fetch" do
    let!(:cocktail_detail1) { create(:cocktail_detail) }
    let!(:cocktail_detail2) { create(:cocktail_detail) }

    it "works" do
      expect(CocktailDetailResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["cocktail_details"])
      expect(d.map(&:id)).to match_array([cocktail_detail1.id,
                                          cocktail_detail2.id])
    end
  end
end
