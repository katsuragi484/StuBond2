class Teacher::SearchesController < ApplicationController
    def search
    if params[:search] == '生徒'
      redirect_to teacher_homeworks_path
    elsif (params[:search] == '報告書内容') || (params[:search] == '教科')
      redirect_to teacher_reports_path
    end
  end
end
