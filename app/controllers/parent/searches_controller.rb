class Parent::SearchesController < ApplicationController
  before_action :authenticate_parent!

  def search
    session[:search] = params[:search]
    session[:word] = params[:word]
    redirect_to parent_reports_path
  end
end
