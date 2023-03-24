class Student::StudentsController < ApplicationController
  before_action :authenticate_student!

  def show
    @student = current_student
  end

  def edit
    @student = current_student
  end

  def update
    @student = current_student
    if @student.update(student_params)
      redirect_to my_page_student_students_path
    else
      render :edit, notice: "変更に失敗しました"
    end
  end

  def withdraw
    @student = Student.find(current_student.id)
    # is_deletedカラムをfalseに変更することにより削除フラグを立てる
    @student.update(is_deleted: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :school, :phone_number, :code, :image)
  end
end
