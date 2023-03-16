class Teacher::HomeworksController < ApplicationController
  def index
    @students = Student.all

  end

  def show
    @student = Student.find(params[:id])
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids)
  end


end
