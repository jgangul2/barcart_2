require "rails_helper"

RSpec.describe UserCustomizedCocktail, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:ingredient) }

    it { should belong_to(:cocktail) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
