require "rails_helper"

RSpec.describe SpiritsDetail, type: :model do
  describe "Direct Associations" do
    it { should have_many(:spirits_brands) }

    it { should have_many(:cocktail_recipes_standards) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
