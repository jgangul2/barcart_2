require 'rails_helper'

RSpec.describe SpiritsBrandResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'spirits_brands',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SpiritsBrandResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SpiritsBrand.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:spirits_brand) { create(:spirits_brand) }

    let(:payload) do
      {
        data: {
          id: spirits_brand.id.to_s,
          type: 'spirits_brands',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SpiritsBrandResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { spirits_brand.reload.updated_at }
      # .and change { spirits_brand.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:spirits_brand) { create(:spirits_brand) }

    let(:instance) do
      SpiritsBrandResource.find(id: spirits_brand.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SpiritsBrand.count }.by(-1)
    end
  end
end
