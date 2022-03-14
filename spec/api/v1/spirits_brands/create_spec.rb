require 'rails_helper'

RSpec.describe "spirits_brands#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/spirits_brands", payload
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
          type: 'spirits_brands',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(SpiritsBrandResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { SpiritsBrand.count }.by(1)
    end
  end
end
