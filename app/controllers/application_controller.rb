class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :teacher
      new_teacher_session_path
    elsif resource_or_scope == :student
      new_student_session_path
    elsif resource_or_scope == :parent
      new_parent_session_path
    else
      new_parent_session_path
    end
  end
  def after_sign_up_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :teacher
      new_teacher_session_path
    elsif resource_or_scope == :student
      new_student_session_path
    elsif resource_or_scope == :parent
      new_parent_session_path
    else
      new_parent_session_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    elsif resource_or_scope == :teacher
      new_teacher_session_path
    elsif resource_or_scope == :student
      new_student_session_path
    elsif resource_or_scope == :parent
      new_parent_session_path
    else
      new_parent_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:code, :email])
  end


end
