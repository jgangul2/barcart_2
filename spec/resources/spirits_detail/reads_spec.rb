require 'rails_helper'

RSpec.describe SpiritsDetailResource, type: :resource do
  describe 'serialization' do
    let!(:spirits_detail) { create(:spirits_detail) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(spirits_detail.id)
      expect(data.jsonapi_type).to eq('spirits_details')
    end
  end

  describe 'filtering' do
    let!(:spirits_detail1) { create(:spirits_detail) }
    let!(:spirits_detail2) { create(:spirits_detail) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: spirits_detail2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([spirits_detail2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:spirits_detail1) { create(:spirits_detail) }
      let!(:spirits_detail2) { create(:spirits_detail) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            spirits_detail1.id,
            spirits_detail2.id
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
            spirits_detail2.id,
            spirits_detail1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
