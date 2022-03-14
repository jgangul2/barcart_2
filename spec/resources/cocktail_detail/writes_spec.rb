require "rails_helper"

RSpec.describe CocktailDetailResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "cocktail_details",
          attributes: {},
        },
      }
    end

    let(:instance) do
      CocktailDetailResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { CocktailDetail.count }.by(1)
    end
  end

  describe "updating" do
    let!(:cocktail_detail) { create(:cocktail_detail) }

    let(:payload) do
      {
        data: {
          id: cocktail_detail.id.to_s,
          type: "cocktail_details",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      CocktailDetailResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { cocktail_detail.reload.updated_at }
      # .and change { cocktail_detail.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:cocktail_detail) { create(:cocktail_detail) }

    let(:instance) do
      CocktailDetailResource.find(id: cocktail_detail.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { CocktailDetail.count }.by(-1)
    end
  end
end
