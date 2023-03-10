class Student::ReportsController < ApplicationController

  def new
    @report = Report.new
    @subjects = Subject.all
  end

  def create
    report = Report.new(report_params)
    report.save
    redirect_to 'teacher_report_path(report.id)'
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  private

  def report_params
    params.require(:report).permit(:title, :body, :subject_id)
  end
end
