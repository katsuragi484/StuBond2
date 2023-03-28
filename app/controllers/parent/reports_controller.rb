class Parent::ReportsController < ApplicationController
  before_action :authenticate_parent!

  def index
    students = Student.where(parent_id: current_parent.id)

    if @search = session[:search]
      if @search == "教科" && @subject = Subject.find_by(subject_name: session[:word])
        @reports = Report.where(student_id: students.ids,subject_id: @subject.id).page(params[:page])
      elsif @search == "報告書内容"
        @reports =Report.where(student_id: students.ids).search(session[:word]).page(params[:page])
      else
        @reports = Report.where(student_id: students.ids).page(params[:page])
      end
    else
      @reports = Report.where(student_id: students.ids).page(params[:page])
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
