require 'rails_helper'

RSpec.describe UserCustomizedCocktailResource, type: :resource do
  describe 'serialization' do
    let!(:user_customized_cocktail) { create(:user_customized_cocktail) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(user_customized_cocktail.id)
      expect(data.jsonapi_type).to eq('user_customized_cocktails')
    end
  end

  describe 'filtering' do
    let!(:user_customized_cocktail1) { create(:user_customized_cocktail) }
    let!(:user_customized_cocktail2) { create(:user_customized_cocktail) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: user_customized_cocktail2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([user_customized_cocktail2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:user_customized_cocktail1) { create(:user_customized_cocktail) }
      let!(:user_customized_cocktail2) { create(:user_customized_cocktail) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            user_customized_cocktail1.id,
            user_customized_cocktail2.id
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
            user_customized_cocktail2.id,
            user_customized_cocktail1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
