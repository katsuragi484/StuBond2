class Parent::ReportsController < ApplicationController

  def index
    students = Student.where(parent_id: current_parent.id)
    @reports = Report.where(student_id: students.ids)
  end

  def show
    @report = Report.find(params[:id])
    @homeworks = Homework.where(report_id: @report.id)
  end

  def edit
    @report = Report.find(params[:id])
    @homeworks = Homework.where(report_id: @report.id)
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to parent_reports_path
    else
      render 'edit'
    end
  end


  private
  def report_params
    params.require(:report).permit(:comment)
  end
end
