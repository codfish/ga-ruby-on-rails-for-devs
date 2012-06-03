class Project < ActiveRecord::Base
  attr_accessible :employees_count, :name
  
	# validates :employees_count, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validate :check_employees_count_positive
	
	has_many :employee_projects
  has_many :employees, :through => :employee_projects
  
  private
  
  def check_employees_count_positive
  	if self.employees_count <= 0
  		errors.add(:employees_count, "Gots to be positive Bro!")
  	end
  end
end
