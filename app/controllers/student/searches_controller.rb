class Student::SearchesController < ApplicationController
  before_action :authenticate_student!

  
  def search
    session[:search] = params[:search]
    session[:word] = params[:word]
    redirect_to student_reports_path
  end
end
