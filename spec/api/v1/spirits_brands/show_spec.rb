require 'rails_helper'

RSpec.describe "spirits_brands#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/spirits_brands/#{spirits_brand.id}", params: params
  end

  describe 'basic fetch' do
    let!(:spirits_brand) { create(:spirits_brand) }

    it 'works' do
      expect(SpiritsBrandResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('spirits_brands')
      expect(d.id).to eq(spirits_brand.id)
    end
  end
end
