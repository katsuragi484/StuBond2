class Teacher::ReportsController < ApplicationController
  before_action :authenticate_teacher!

  def new
    @report = Report.new

    # build_method:親モデルに属する子モデルのインスタンスを新たに生成したい場合に使うメソッド。
    6.times {@report.homeworks.build}

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

  def edit
    @report = Report.find(params[:id])
    @students = Student.all
    @subjects = Subject.all
    @report.homeworks.build

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
    # _destroyは、Homeworkモデルのフォームが空のときに空データが送信されないために追加
    params.require(:report).permit(:student_id, :teacher_id, :body, :title, :subject_id, homeworks_attributes: [:id, :task, :deadline,:is_done, :_destroy])
  end
end
