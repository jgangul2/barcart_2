require "rails_helper"

RSpec.describe SpiritsBrand, type: :model do
  describe "Direct Associations" do
    it { should have_many(:user_customized_cocktails) }

    it { should have_many(:user_bar_carts) }

    it { should have_many(:store_inventories) }

    it { should belong_to(:spirit) }
  end

  describe "InDirect Associations" do
    it { should have_many(:stores) }
  end

  describe "Validations" do
  end
end
