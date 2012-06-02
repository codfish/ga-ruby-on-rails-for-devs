class Employee < ActiveRecord::Base
  attr_accessible :address, :name, :start_date
  
	validates :name, :presence => true
	validates :address, :presence => true
	validates :start_date, :presence => true
  
  belongs_to :role
end
