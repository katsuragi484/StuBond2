class Admin::SubjectsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @subject = Subject.new
    @subjects = Subject.page(params[:page])
  end

  def create
    subject = Subject.new(subject_params)
    if subject.save
      redirect_to admin_subjects_path
    else
      @subjects = Subject.page(params[:page])
      render 'index'
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to admin_subjects_path
    else
      render 'edit'
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:subject_name)
  end

end
