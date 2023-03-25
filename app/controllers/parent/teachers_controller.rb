class Parent::TeachersController < ApplicationController
  before_action :authenticate_parent!

  def index
    @teachers = Teacher.page(params[:page])
  end

  def show
    @teacher = Teacher.find(params[:id])
  end
end
