require 'rails_helper'

RSpec.describe "spirits_details#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/spirits_details/#{spirits_detail.id}"
  end

  describe 'basic destroy' do
    let!(:spirits_detail) { create(:spirits_detail) }

    it 'updates the resource' do
      expect(SpiritsDetailResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { SpiritsDetail.count }.by(-1)
      expect { spirits_detail.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
