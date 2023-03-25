class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if @search = session[:search]
      if @search == "教科" && @subject = Subject.find_by(subject_name: session[:word])
        @reports = Report.where(subject_id: @subject.id).page(params[:page])
      elsif @search == "報告書内容"
        @reports =Report.search(session[:word]).page(params[:page])
      end
    else
      @reports = Report.page(params[:page])
    end
    if session[:search]
      session[:search].clear
    end
    if session[:word]
      session[:word].clear
    end
  end

  def show
    @report = Report.find(params[:id])
    @homeworks = Homework.where(report_id: @report.id)
  end

end
