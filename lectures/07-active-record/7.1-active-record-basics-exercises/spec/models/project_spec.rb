require 'spec_helper'

describe Project do

	context "validations" do
    #it { should validate_presence_of :name }
    #it { should validate_presence_of :employees_count }
    it "should have a positive employees count" do
    	#Project.new.should_not be_valid
    	Fabricate.build(:project).should be_valid
    end
    
    it "should fail with a negative employees count" do
    	Project.new(:name => "new project", :employees_count => -3).should_not be_valid
    end
  end

  context "associations" do
    it { should have_many(:employee_projects) } # is this necessary?
    it { should have_many(:employees).through(:employee_projects) }
  end

  context "fabricators" do
    let(:project) { Fabricate(:project) }
    
    it "creates a valid project" do
    	project.should be_valid
    end
  end
  
end
