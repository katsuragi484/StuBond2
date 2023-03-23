class Student::TeachersController < ApplicationController
  before_action :authenticate_student!

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
  end
end
