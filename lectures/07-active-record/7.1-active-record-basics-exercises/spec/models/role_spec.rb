require 'spec_helper'

describe Role do

  context "validations" do
  	#let(:role) { Role.new }
    
    #before(:each) do
    #  role.name = "Web Developer Extraordinar"
    #  role.department = "Web Team"
    #end
    
    it { should validate_presence_of :name }
    it { should validate_presence_of :department }
  end

  context "associations" do
    it { should have_many :employees }
  end

  context "fabricators" do
    let(:role) { Fabricate(:role) }
    
    it "creates a valid employee" do
    	role.should be_valid
    end
  end
end
