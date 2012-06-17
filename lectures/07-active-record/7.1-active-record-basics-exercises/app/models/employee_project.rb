class EmployeeProject < ActiveRecord::Base
  attr_accessible :employee_id, :project_id
  
  belongs_to :project
  belongs_to :employee
  
  before_validation :update_employee_count # i do it after save because i know the row was added
  
  private
  
  	def update_employee_count
  		project.employees_count = project.employees.size
  	end
end
