class Admin::TeachersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @teachers = Teacher.page(params[:page])
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher.id)
    else
      render :edit, notice: "変更に失敗しました"
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :word, :phone_number, :code, :image)
  end
end
