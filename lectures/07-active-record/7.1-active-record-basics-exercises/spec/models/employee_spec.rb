require 'spec_helper'

describe Employee do
  context "validations" do
    #let(:employee) { Employee.new }
    
    #before(:each) do
    #  employee.name = "Name"
    #  employee.address = "2324 Highlander Drive"
    #  employee.start_date = Date.today
    #end
    
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :start_date }
  end

  context "associations" do
    it { should belong_to :role }
  end

  context "fabricators" do
    let(:employee) { Fabricate(:employee) }
    
    it "creates a valid employee" do
    	employee.should be_valid
    end
  end
end
