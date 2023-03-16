class Admin::StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to admin_student_path(@student.id)
    else
      render :edit, notice: "変更に失敗しました"
    end
  end

  private

  def student_params
    params.require(:student).permit(:is_deleted, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :school, :phone_number, :code)
  end
end
