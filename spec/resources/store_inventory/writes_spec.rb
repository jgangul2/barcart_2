require 'rails_helper'

RSpec.describe StoreInventoryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'store_inventories',
          attributes: { }
        }
      }
    end

    let(:instance) do
      StoreInventoryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { StoreInventory.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:store_inventory) { create(:store_inventory) }

    let(:payload) do
      {
        data: {
          id: store_inventory.id.to_s,
          type: 'store_inventories',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StoreInventoryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { store_inventory.reload.updated_at }
      # .and change { store_inventory.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:store_inventory) { create(:store_inventory) }

    let(:instance) do
      StoreInventoryResource.find(id: store_inventory.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { StoreInventory.count }.by(-1)
    end
  end
end
