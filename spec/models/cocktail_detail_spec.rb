require 'rails_helper'

RSpec.describe CocktailDetail, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:cocktail_recipes_standards) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
