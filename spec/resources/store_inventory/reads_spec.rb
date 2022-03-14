require "rails_helper"

RSpec.describe StoreInventoryResource, type: :resource do
  describe "serialization" do
    let!(:store_inventory) { create(:store_inventory) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(store_inventory.id)
      expect(data.jsonapi_type).to eq("store_inventories")
    end
  end

  describe "filtering" do
    let!(:store_inventory1) { create(:store_inventory) }
    let!(:store_inventory2) { create(:store_inventory) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: store_inventory2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([store_inventory2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:store_inventory1) { create(:store_inventory) }
      let!(:store_inventory2) { create(:store_inventory) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      store_inventory1.id,
                                      store_inventory2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      store_inventory2.id,
                                      store_inventory1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
