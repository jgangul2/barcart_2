require "rails_helper"

RSpec.describe CocktailFavoritesUserResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "cocktail_favorites_users",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CocktailFavoritesUserResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CocktailFavoritesUser.count }.by(1)
    end
  end

  describe "updating" do
    let!(:cocktail_favorites_user) { create(:cocktail_favorites_user) }

    let(:payload) do
      {
        data: {
          id: cocktail_favorites_user.id.to_s,
          type: "cocktail_favorites_users",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CocktailFavoritesUserResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { cocktail_favorites_user.reload.updated_at }
      # .and change { cocktail_favorites_user.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:cocktail_favorites_user) { create(:cocktail_favorites_user) }

    let(:instance) do
      CocktailFavoritesUserResource.find(id: cocktail_favorites_user.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CocktailFavoritesUser.count }.by(-1)
    end
  end
end
