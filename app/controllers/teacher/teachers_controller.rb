class Teacher::TeachersController < ApplicationController
  before_action :authenticate_teacher!

  def show
    @teacher = current_teacher
  end

  def edit
    @teacher = current_teacher
  end

  def update
    @teacher = current_teacher
    if @teacher.update(teacher_params)
      redirect_to my_page_teacher_teachers_path
    else
      render :edit, notice: "変更に失敗しました"
    end
  end

  def withdraw
    @teacher = Teacher.find(current_teacher.id)
    # is_deletedカラムをfalseに変更することにより削除フラグを立てる
    @teacher.update(is_deleted: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :word, :phone_number, :code, :image)
  end
end
