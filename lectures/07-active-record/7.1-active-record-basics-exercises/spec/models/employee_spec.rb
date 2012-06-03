require 'spec_helper'

describe Employee do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :start_date }
  end

  context "associations" do
    it { should belong_to :role }
    it { should have_many(:projects).through(:employee_projects) }
  end

  context "fabricators" do
    let(:employee) { Fabricate(:employee) }
    
    it "creates a valid employee" do
    	employee.should be_valid
    end
  end
end
