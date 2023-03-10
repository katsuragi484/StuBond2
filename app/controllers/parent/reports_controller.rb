class Parent::ReportsController < ApplicationController

  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def edit
    @report = Report.find(params[:id])

  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      redirect_to parent_reports_path
    else
      render 'edit'
    end
  end


  private
  def report_params
    params.require(:report).permit(:comment)
  end
end
