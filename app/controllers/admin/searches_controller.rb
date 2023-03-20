class Admin::SearchesController < ApplicationController
  def search
    session[:search] = params[:search]
    session[:word] = params[:word]
    if params[:search] == '生徒'
      redirect_to admin_homeworks_path
    elsif (params[:search] == '報告書内容') || (params[:search] == '教科')
      redirect_to admin_reports_path
    end
  end
end
