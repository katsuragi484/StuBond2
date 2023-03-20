class Admin::HomeworksController < ApplicationController
  def index
     @search = session[:search]
    if @search == "生徒"
      @students = Student.search(session[:word])
    else
      @students = Student.all
    end
    session[:search].clear
    session[:word].clear
  end

  def show
    @student = Student.find(params[:id])
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids)
  end
end
