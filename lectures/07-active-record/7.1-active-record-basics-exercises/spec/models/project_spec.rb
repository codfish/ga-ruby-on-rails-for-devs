require 'spec_helper'

describe Project do

	context "before validation" do
    let(:project) { Project.new }

    it "should update the employees_count" do
      project.employees << Fabricate(:employee)
      project.employees << Fabricate(:employee)
      project.valid?
      project.employees_count.should eql(2)
    end
  end
  
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
    let(:project) { Fabricate.build(:project) }
    
    it "creates a valid project" do
    	project.save.should === true
    end
  end
  
  context "description" do
		let(:project) { Project.new }

    it "should return a static default project description" do    	
    	project.description.should === "I'm only a normal project :(."
    end
  end
  
end

describe DevelopmentProject do

  context "description" do
		let(:development_project) { DevelopmentProject.new }

    it "should return a static development project description" do    	
    	development_project.description.should === "I'm a development project :)."
    end
  end
  
end

describe HrProject do

  context "description" do
		let(:hr_project) { HrProject.new }

    it "should return a static hr project description" do    	
    	hr_project.description.should === "I'm a HR project."
    end
  end
  
end

describe MarketingProject do

  context "description" do
		let(:marketing_project) { MarketingProject.new }

    it "should return a static marketing project description" do    	
    	marketing_project.description.should === "I'm a marketing project."
    end
  end
  
end
