require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:recipes) }

    it { should have_many(:compositions) }

    it { should have_many(:restaurants) }

    it { should have_many(:contacts) }

    it { should have_many(:ingredients) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
