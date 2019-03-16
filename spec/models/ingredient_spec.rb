require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:compositions) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
