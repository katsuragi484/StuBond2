class Admin::HomeworksController < ApplicationController
  before_action :authenticate_admin!

  def index
    if session[:search] && session[:word]
      @search = session[:search]
      if @search == "生徒"
        @students = Student.search(session[:word]).page(params[:page])
      else
        @students = Student.page(params[:page])
      end
      session[:search].clear
      session[:word].clear
    else
      @students = Student.page(params[:page])
    end
  end

  def show
    @student = Student.find(params[:id])
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids).page(params[:page])
  end
end
