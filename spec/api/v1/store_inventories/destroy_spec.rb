require "rails_helper"

RSpec.describe "store_inventories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/store_inventories/#{store_inventory.id}"
  end

  describe "basic destroy" do
    let!(:store_inventory) { create(:store_inventory) }

    it "updates the resource" do
      expect(StoreInventoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { StoreInventory.count }.by(-1)
      expect { store_inventory.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
