require "rails_helper"

RSpec.describe UserBarCartResource, type: :resource do
  describe "serialization" do
    let!(:user_bar_cart) { create(:user_bar_cart) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_bar_cart.id)
      expect(data.jsonapi_type).to eq("user_bar_carts")
    end
  end

  describe "filtering" do
    let!(:user_bar_cart1) { create(:user_bar_cart) }
    let!(:user_bar_cart2) { create(:user_bar_cart) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: user_bar_cart2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([user_bar_cart2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:user_bar_cart1) { create(:user_bar_cart) }
      let!(:user_bar_cart2) { create(:user_bar_cart) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      user_bar_cart1.id,
                                      user_bar_cart2.id,
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
                                      user_bar_cart2.id,
                                      user_bar_cart1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
