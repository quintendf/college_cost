class StudentsController < ApplicationController
  autocomplete :price, :college
  autocomplete :salary, :major
  
	def new 
  		@student = Student.new
  	end

  	def create 
  		@student = Student.create(student_params)
  	end

    def form_complete?
      if @student.monthly_cost
      end
    end

  private

  def student_params
    params.require(:student).permit(:college, :major, :cost, :scholarships, :cost, :contribution)
  end
end
