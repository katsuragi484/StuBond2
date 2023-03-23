class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if @search = session[:search]
      if @search == "教科" && @subject = Subject.find_by(subject_name: session[:word])
        @reports = Report.where(subject_id: @subject.id)
      elsif @search == "報告書内容"
        @reports =Report.search(session[:word])
      end
    else
        @reports = Report.all
    end
    if session[:search]
      session[:search].clear
    end
    if session[:search]
      session[:word].clear
    end
  end

  def show
    @report = Report.find(params[:id])
    @homeworks = Homework.where(report_id: @report.id)
  end

end
