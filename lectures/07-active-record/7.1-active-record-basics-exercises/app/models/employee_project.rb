class EmployeeProject < ActiveRecord::Base
  attr_accessible :employee_id, :project_id
  
  belongs_to :project
  belongs_to :employee
end
