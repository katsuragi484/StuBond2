class Teacher::ReportsController < ApplicationController
  def new
    @report = Report.new
    @subject = Subject.all
  end

  def create
    report = Report.new(report_params)
    report.save
    redirect_to teacher_reports_path
  end


  private
  def report_params
    params.require(:report).permit(:body, :title, :subject)
  end
end
