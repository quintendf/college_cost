class Student < ActiveRecord::Base
	after_initialize :init 

	def init
		self.yearly_cost = find_cost
		self.monthly_salary = find_salary
	end

	def find_cost
		@cost = Price.where(college: self.college).pluck(:price).at(0)
	end

	def find_salary
		@salary = Salary.where(major: self.major).pluck(:starting_salary).at(0)
		@salary = @salary.to_f / 12
	end
end
