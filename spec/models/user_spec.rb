require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:user_customized_cocktails) }

    it { should have_many(:user_bar_carts) }

    it { should have_many(:cocktail_favorites_users) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
