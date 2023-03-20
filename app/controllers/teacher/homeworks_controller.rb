class Teacher::HomeworksController < ApplicationController
  def index
    @students = Student.all

    @search = params[:search]
    if @search == "生徒"
      @students = Student.search(params[:word])
    elsif @search == "報告書内容"
      @reports = Report.search(params[:word])
    end

  end

  def show
    @student = Student.find(params[:id])
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids)
  end


end
