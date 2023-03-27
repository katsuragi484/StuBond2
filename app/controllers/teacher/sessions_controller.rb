# frozen_string_literal: true

class Teacher::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

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
    my_page_teacher_teachers_path
  end

  # The path used after sign out.
  def after_sign_out_path_for(resource)
    new_teacher_session_path
  end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:code])
   end

    def teacher_state
      ## 【処理内容1】 入力されたemailからアカウントを1件取得
      @teacher = Teacher.find_by(code: params[:teacher][:code])
      ## アカウントを取得できなかった場合、このメソッドを終了する
      return if !@teacher
      ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
      if !@teacher.is_deleted
        ## 【処理内容3】
        flash[:danger] = '退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_teacher_session_path
      elsif !@teacher.valid_password?(params[:teacher][:password])
        flash[:danger] = 'ログインコードまたはパスワードに誤りがございます。'
        redirect_to new_teacher_session_path
      else
      end
    end
end
