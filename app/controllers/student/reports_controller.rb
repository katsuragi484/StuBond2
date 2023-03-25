class Student::ReportsController < ApplicationController
  before_action :authenticate_student!

  def index
    if @search = params[:search]
      if @search == "教科" && @subject = Subject.find_by(subject_name: params[:word])
        @reports = Report.where(subject_id: @subject.id).page(params[:page])
      elsif @search == "報告書内容"
        @reports =Report.search(params[:word]).page(params[:page])
      else
        @reports = Report.page(params[:page])
      end
    end
  end

  def show
    @report = Report.find(params[:id])
    @homeworks = Homework.where(report_id: @report.id)
  end

end
