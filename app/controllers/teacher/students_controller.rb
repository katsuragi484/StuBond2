class Teacher::StudentsController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @students = Student.page(params[:page])
  end

  def show
    @student = Student.find(params[:id])
  end


end
