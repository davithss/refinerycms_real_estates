require 'spec_helper'

describe RealEstate do

  def reset_real_estate(options = {})
    @valid_attributes = {
      :id => 1,
      :house => "RSpec is great for testing too"
    }

    @real_estate.destroy! if @real_estate
    @real_estate = RealEstate.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_real_estate
  end

  context "validations" do
    
    it "rejects empty house" do
      RealEstate.new(@valid_attributes.merge(:house => "")).should_not be_valid
    end

    it "rejects non unique house" do
      # as one gets created before each spec by reset_real_estate
      RealEstate.new(@valid_attributes).should_not be_valid
    end
    
  end

end