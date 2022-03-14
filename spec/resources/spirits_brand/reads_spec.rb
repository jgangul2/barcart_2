require 'rails_helper'

RSpec.describe SpiritsBrandResource, type: :resource do
  describe 'serialization' do
    let!(:spirits_brand) { create(:spirits_brand) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(spirits_brand.id)
      expect(data.jsonapi_type).to eq('spirits_brands')
    end
  end

  describe 'filtering' do
    let!(:spirits_brand1) { create(:spirits_brand) }
    let!(:spirits_brand2) { create(:spirits_brand) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: spirits_brand2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([spirits_brand2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:spirits_brand1) { create(:spirits_brand) }
      let!(:spirits_brand2) { create(:spirits_brand) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            spirits_brand1.id,
            spirits_brand2.id
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
            spirits_brand2.id,
            spirits_brand1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
