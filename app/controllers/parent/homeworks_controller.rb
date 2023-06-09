class Parent::HomeworksController < ApplicationController
  before_action :authenticate_parent!

  def index
    @students = Student.where(parent_id: current_parent.id).page(params[:page])
  end

  def show
    @student = Student.find(params[:id])
    @reports = Report.where(student_id: @student.id)
    @homeworks = Homework.where(report_id: @reports.ids).page(params[:page])
  end
end
