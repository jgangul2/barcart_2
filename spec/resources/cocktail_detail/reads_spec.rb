require "rails_helper"

RSpec.describe CocktailDetailResource, type: :resource do
  describe "serialization" do
    let!(:cocktail_detail) { create(:cocktail_detail) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(cocktail_detail.id)
      expect(data.jsonapi_type).to eq("cocktail_details")
    end
  end

  describe "filtering" do
    let!(:cocktail_detail1) { create(:cocktail_detail) }
    let!(:cocktail_detail2) { create(:cocktail_detail) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: cocktail_detail2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([cocktail_detail2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:cocktail_detail1) { create(:cocktail_detail) }
      let!(:cocktail_detail2) { create(:cocktail_detail) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      cocktail_detail1.id,
                                      cocktail_detail2.id,
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
                                      cocktail_detail2.id,
                                      cocktail_detail1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
