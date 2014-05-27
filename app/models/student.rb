class Student < ActiveRecord::Base
	after_initialize :init 
	belongs_to :price

	def init
		self.yearly_cost = find_cost
		self.monthly_salary = find_salary
		self.total_debt = calc_debt
		self.monthly_cost = calc_monthly
	end

	def find_cost
		@cost = Price.where(college: self.college).pluck(:price).at(0)
	end

	def find_salary
		@salary = Salary.where(major: self.major).pluck(:starting_salary).at(0)
		@salary = @salary.to_i / 12
	end

	def calc_debt
		@debt = ((yearly_cost.to_i - contribution.to_i) * 4)
	end

	def calc_monthly
	  # Convert annual rate to monthly and make it decimal.
	  r = 6.8 / 1200
	 
	  # Numerator
	  n = r * self.total_debt.to_i
	 
	  # Denominator
	  d = 1 - (1 + r)**-120
	 
	  # Calc the monthly payment.
	  pmt = n / d
	  pmt = pmt.to_i
	end
end
