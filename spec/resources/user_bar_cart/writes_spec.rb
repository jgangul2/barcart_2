require 'rails_helper'

RSpec.describe UserBarCartResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'user_bar_carts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UserBarCartResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { UserBarCart.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:user_bar_cart) { create(:user_bar_cart) }

    let(:payload) do
      {
        data: {
          id: user_bar_cart.id.to_s,
          type: 'user_bar_carts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UserBarCartResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { user_bar_cart.reload.updated_at }
      # .and change { user_bar_cart.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:user_bar_cart) { create(:user_bar_cart) }

    let(:instance) do
      UserBarCartResource.find(id: user_bar_cart.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { UserBarCart.count }.by(-1)
    end
  end
end
