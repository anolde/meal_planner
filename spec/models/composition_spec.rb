require 'rails_helper'

RSpec.describe Composition, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:recipe) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
