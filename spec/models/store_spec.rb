require 'rails_helper'

RSpec.describe Store, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:store_inventories) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
