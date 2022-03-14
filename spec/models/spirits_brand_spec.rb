require 'rails_helper'

RSpec.describe SpiritsBrand, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:spirit) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
