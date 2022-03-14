require "rails_helper"

RSpec.describe "cocktail_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/cocktail_details/#{cocktail_detail.id}", payload
  end

  describe "basic update" do
    let!(:cocktail_detail) { create(:cocktail_detail) }

    let(:payload) do
      {
        data: {
          id: cocktail_detail.id.to_s,
          type: "cocktail_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(CocktailDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { cocktail_detail.reload.attributes }
    end
  end
end
