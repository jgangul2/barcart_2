require "rails_helper"

RSpec.describe "spirits_details#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/spirits_details/#{spirits_detail.id}", payload
  end

  describe "basic update" do
    let!(:spirits_detail) { create(:spirits_detail) }

    let(:payload) do
      {
        data: {
          id: spirits_detail.id.to_s,
          type: "spirits_details",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SpiritsDetailResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { spirits_detail.reload.attributes }
    end
  end
end
