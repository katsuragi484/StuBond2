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

  def toggle
    report = Report.find(params[:report_id])
    report.is_parent_read = !report.is_parent_read
    report.save
    redirect_to parent_report_path(report.id)
  end


  private
  def report_params
    params.require(:report).permit(:comment)
  end
end
