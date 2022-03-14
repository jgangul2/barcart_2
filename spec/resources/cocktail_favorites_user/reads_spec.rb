require "rails_helper"

RSpec.describe CocktailFavoritesUserResource, type: :resource do
  describe "serialization" do
    let!(:cocktail_favorites_user) { create(:cocktail_favorites_user) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(cocktail_favorites_user.id)
      expect(data.jsonapi_type).to eq("cocktail_favorites_users")
    end
  end

  describe "filtering" do
    let!(:cocktail_favorites_user1) { create(:cocktail_favorites_user) }
    let!(:cocktail_favorites_user2) { create(:cocktail_favorites_user) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: cocktail_favorites_user2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([cocktail_favorites_user2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:cocktail_favorites_user1) { create(:cocktail_favorites_user) }
      let!(:cocktail_favorites_user2) { create(:cocktail_favorites_user) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      cocktail_favorites_user1.id,
                                      cocktail_favorites_user2.id,
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
                                      cocktail_favorites_user2.id,
                                      cocktail_favorites_user1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
