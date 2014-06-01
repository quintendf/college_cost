class Student < ActiveRecord::Base
	serialize :explainer_text,Array
	after_initialize :init 
	belongs_to :price

	def init
		self.yearly_cost = find_cost
		self.monthly_salary = find_salary
		self.total_debt = calc_debt
		self.monthly_cost = calc_monthly
		self.grade = calc_grade
		self.explainer_text = text_array
	end

	def find_cost
		@cost = Price.where(college: self.college).pluck(:price).at(0)

	end

	def find_salary
		@salary = Salary.where(major: self.major).pluck(:starting_salary).at(0)
		@salary = @salary.to_i / 12
	end

	def calc_debt
		@debt = (yearly_cost.to_i * 4) - contribution.to_i
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

	def calc_grade
		if monthly_cost < (monthly_salary * 0.10)
			return "A"
		elsif monthly_cost < (monthly_salary * 0.15)
			return "B"
		elsif monthly_cost < (monthly_salary * 0.20)
			return "C"
		elsif monthly_cost < (monthly_salary * 0.25)
			return "D"			
		else 
			return "F"
		end
	end

	def text_array
		array = Array.new

		if grade == "A"
			str = "Your expected college debt of $" + @debt.to_s + " will be manageable on your expected starting 
			annual salary of $" + @salary.to_s + ". See below for more details on your grade, and suggestions on 
			how you might do even better."
			array.push str
		elsif grade == "B"
			str = "Your expected college debt of $" + @debt.to_s + " will be reasonably manageable on your expected starting 
			annual salary of $" + @salary.to_s + ". You may be able to find a more affordable college - see below for more 
			information and suggestions."
			array.push str
		elsif grade == "C"
			str = "Your expected college debt of $" + @debt.to_s + " will be tough to repay on your expected starting 
			annual salary of $" + @salary.to_s + ". Below, we give you a few recommendations for ways to save money and make 
			your student loans more affordable."
			array.push str
		elsif grade == "D"
			str = "Your expected college debt of $" + @debt.to_s + " will be very difficult to repay on your estimated 
			annual salary of $" + @salary.to_s + ". The good news is that there's lots of ways to make college loans more 
			affordable - see below for some different options that might help."
			array.push str
		elsif grade == "F"
			str = "Your college loans will be impossible to repay, and we strongly recommend considering either a different
			school, or perhaps a different major. See below for some detailed recommendations."
			array.push str
		end

		if total_debt < 15000
			str = "You're on track to graduate with an impressively low amount of student debt, less than half the 
			average graduate."
			array.push str
		elsif total_debt < 33000
			str = "You're likely going to graduate with less debt than the average student. This is a great way to
			make sure your payments are manageable after college."
			array.push str
		elsif total_debt < 40000
			str = "You're taking on a little more debt than the average graduate. This means it's important to chose 
			your major carefully, so you can afford to easily pay the debt off after you graduate."
			array.push str
		elsif total_debt < 65000
			str = "You're in dangerous territory, taking on nearly twice the debt of the average graduate. Unless you're
			going immediately into a highly lucrative field, you should strongly consider a different school. Even then, 
			you can probably find more value for your money elsewhere."
			array.push str
		else
			str = "You're taking on an extreme amount of debt, more than twice the average graduate. There are many more 
			affordable options for college, and you should look at less expensive schools, or maybe transferring from a 
			community college."
			array.push str
		end
		return array
	end
end
