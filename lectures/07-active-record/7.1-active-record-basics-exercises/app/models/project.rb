class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name, :type
  
	# validates :employees_count, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
	before_validation :set_current_employees_count
  validate :validate_employees_count_positive
	
	has_many :employee_projects
  has_many :employees, :through => :employee_projects
  
  def description
  	"I'm only a normal project :(."
  end
  
  private
  
	  def set_current_employees_count
	  	self.employees_count = self.employees.size
	  end
	  
	  def validate_employees_count_positive
	  	if self.employees_count <= 0
	  		errors.add(:employees_count, "Gots to be positive bro!")
	  	end
	  end
  
end
