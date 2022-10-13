class StudentsController < ApplicationController

  def index
    #byebug
    if params[:name]==nil
      students = Student.all 
    else 
      name = params[:name].titleize
      students = Student.where(first_name: name).or(Student.where(last_name: name))
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
