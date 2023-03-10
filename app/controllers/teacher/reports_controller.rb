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
    @report = Report.new
    @students = Student.all
    @subjects = Subject.all
      render 'new'
    end
  end

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])
    @students = Student.all
    @subjects = Subject.all
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to teacher_reports_path
    else
      @students = Student.all
      @subjects = Subject.all
      render 'edit'
    end
  end


  private
  def report_params
    params.require(:report).permit(:student_id, :teacher_id, :body, :title, :subject_id)
  end
end
