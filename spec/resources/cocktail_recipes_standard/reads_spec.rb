require 'rails_helper'

RSpec.describe CocktailRecipesStandardResource, type: :resource do
  describe 'serialization' do
    let!(:cocktail_recipes_standard) { create(:cocktail_recipes_standard) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(cocktail_recipes_standard.id)
      expect(data.jsonapi_type).to eq('cocktail_recipes_standards')
    end
  end

  describe 'filtering' do
    let!(:cocktail_recipes_standard1) { create(:cocktail_recipes_standard) }
    let!(:cocktail_recipes_standard2) { create(:cocktail_recipes_standard) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: cocktail_recipes_standard2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([cocktail_recipes_standard2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:cocktail_recipes_standard1) { create(:cocktail_recipes_standard) }
      let!(:cocktail_recipes_standard2) { create(:cocktail_recipes_standard) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            cocktail_recipes_standard1.id,
            cocktail_recipes_standard2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            cocktail_recipes_standard2.id,
            cocktail_recipes_standard1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
