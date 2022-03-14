require 'rails_helper'

RSpec.describe "cocktail_details#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/cocktail_details", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'cocktail_details',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(CocktailDetailResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { CocktailDetail.count }.by(1)
    end
  end
end
