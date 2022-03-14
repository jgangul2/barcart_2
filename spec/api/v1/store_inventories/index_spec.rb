require "rails_helper"

RSpec.describe "store_inventories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/store_inventories", params: params
  end

  describe "basic fetch" do
    let!(:store_inventory1) { create(:store_inventory) }
    let!(:store_inventory2) { create(:store_inventory) }

    it "works" do
      expect(StoreInventoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["store_inventories"])
      expect(d.map(&:id)).to match_array([store_inventory1.id,
                                          store_inventory2.id])
    end
  end
end
