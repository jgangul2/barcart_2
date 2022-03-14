require "rails_helper"

RSpec.describe UserCustomizedCocktailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "user_customized_cocktails",
          attributes: {},
        },
      }
    end

    let(:instance) do
      UserCustomizedCocktailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { UserCustomizedCocktail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:user_customized_cocktail) { create(:user_customized_cocktail) }

    let(:payload) do
      {
        data: {
          id: user_customized_cocktail.id.to_s,
          type: "user_customized_cocktails",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      UserCustomizedCocktailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { user_customized_cocktail.reload.updated_at }
      # .and change { user_customized_cocktail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:user_customized_cocktail) { create(:user_customized_cocktail) }

    let(:instance) do
      UserCustomizedCocktailResource.find(id: user_customized_cocktail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { UserCustomizedCocktail.count }.by(-1)
    end
  end
end
