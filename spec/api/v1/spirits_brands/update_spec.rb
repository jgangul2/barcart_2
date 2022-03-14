require "rails_helper"

RSpec.describe "spirits_brands#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/spirits_brands/#{spirits_brand.id}", payload
  end

  describe "basic update" do
    let!(:spirits_brand) { create(:spirits_brand) }

    let(:payload) do
      {
        data: {
          id: spirits_brand.id.to_s,
          type: "spirits_brands",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SpiritsBrandResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { spirits_brand.reload.attributes }
    end
  end
end
