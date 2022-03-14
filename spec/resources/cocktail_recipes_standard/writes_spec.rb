require "rails_helper"

RSpec.describe CocktailRecipesStandardResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "cocktail_recipes_standards",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CocktailRecipesStandardResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CocktailRecipesStandard.count }.by(1)
    end
  end

  describe "updating" do
    let!(:cocktail_recipes_standard) { create(:cocktail_recipes_standard) }

    let(:payload) do
      {
        data: {
          id: cocktail_recipes_standard.id.to_s,
          type: "cocktail_recipes_standards",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CocktailRecipesStandardResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { cocktail_recipes_standard.reload.updated_at }
      # .and change { cocktail_recipes_standard.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:cocktail_recipes_standard) { create(:cocktail_recipes_standard) }

    let(:instance) do
      CocktailRecipesStandardResource.find(id: cocktail_recipes_standard.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CocktailRecipesStandard.count }.by(-1)
    end
  end
end
