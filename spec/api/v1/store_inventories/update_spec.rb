require "rails_helper"

RSpec.describe "store_inventories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/store_inventories/#{store_inventory.id}", payload
  end

  describe "basic update" do
    let!(:store_inventory) { create(:store_inventory) }

    let(:payload) do
      {
        data: {
          id: store_inventory.id.to_s,
          type: "store_inventories",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(StoreInventoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { store_inventory.reload.attributes }
    end
  end
end
