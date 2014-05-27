class StudentsController < ApplicationController
	def new 
  		@student = Student.new
  	end

  	def create 
  		Student.create(student_params)
  	end

  private

  def student_params
    params.require(:student).permit(:college, :major, :cost, :scholarships, :cost, :contribution)
  end

end
