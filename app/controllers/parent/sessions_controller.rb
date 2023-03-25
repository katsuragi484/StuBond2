# frozen_string_literal: true

class Parent::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :parent_state, only: [:create]

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
    my_page_parent_parents_path
  end

  # The path used after sign out.
  def after_sign_out_path_for(resource)
    new_parent_session_path
  end

  def parent_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @parent = Parent.find_by(code: params[:parent][:code])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@parent
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @parent.students
      if @parent.valid_password?(params[:parent][:password]) && @parent.students.where(is_deleted: true).count > 0
      else
        flash[:danger] = '退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_parent_session_path
      end
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
