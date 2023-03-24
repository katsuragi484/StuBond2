# frozen_string_literal: true

class Student::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :student_state, only: [:create]


  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end



  protected

  # The path used after sign in.
  def after_sign_in_path_for(resource)
    my_page_student_students_path
  end

  # The path used after sign out.
  def after_sign_out_path_for(resource)
    new_student_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :school, :parent_id, :image])
  end

  def student_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @student = Student.find_by(code: params[:student][:code])
    # byebug
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@student
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @student.valid_password?(params[:student][:password])&& @student.is_deleted
    else
      flash[:danger] = '退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
      redirect_to new_student_session_path

    end
  end

end
