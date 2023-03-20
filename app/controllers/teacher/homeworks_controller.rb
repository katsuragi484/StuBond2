class Teacher::HomeworksController < ApplicationController
  def index
    @search = session[:search]
    if @search == "生徒"
      @students = Student.search(params[:word])
    else
      @students = Student.all
    end

  end

  def show
    @student = Student.find(params[:id])
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids)
  end


end
