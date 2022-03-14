require 'rails_helper'

RSpec.describe SpiritsDetailResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'spirits_details',
          attributes: { }
        }
      }
    end

    let(:instance) do
      SpiritsDetailResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { SpiritsDetail.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:spirits_detail) { create(:spirits_detail) }

    let(:payload) do
      {
        data: {
          id: spirits_detail.id.to_s,
          type: 'spirits_details',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      SpiritsDetailResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { spirits_detail.reload.updated_at }
      # .and change { spirits_detail.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:spirits_detail) { create(:spirits_detail) }

    let(:instance) do
      SpiritsDetailResource.find(id: spirits_detail.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { SpiritsDetail.count }.by(-1)
    end
  end
end
