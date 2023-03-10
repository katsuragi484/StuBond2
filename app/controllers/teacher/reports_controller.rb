class Teacher::ReportsController < ApplicationController
  def new
    @report = Report.new
    @students = Student.all
    @subjects = Subject.all
  end

  def create
    report = Report.new(report_params)
    if report.save
    redirect_to teacher_reports_path
    else
    end
  end


  private
  def report_params
    params.require(:report).permit(:student_id, :teacher_id, :body, :title, :subject_id)
  end
end
