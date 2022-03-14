require "rails_helper"

RSpec.describe "store_inventories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/store_inventories/#{store_inventory.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:store_inventory) { create(:store_inventory) }

    it "works" do
      expect(StoreInventoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("store_inventories")
      expect(d.id).to eq(store_inventory.id)
    end
  end
end
