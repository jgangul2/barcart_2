require 'rails_helper'

RSpec.describe "spirits_brands#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/spirits_brands/#{spirits_brand.id}"
  end

  describe 'basic destroy' do
    let!(:spirits_brand) { create(:spirits_brand) }

    it 'updates the resource' do
      expect(SpiritsBrandResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SpiritsBrand.count }.by(-1)
      expect { spirits_brand.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
