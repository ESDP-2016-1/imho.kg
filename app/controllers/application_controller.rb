class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def access_denied(exception)
    flash[:danger] = exception.message
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
      role = resource.role
    case role.name
      when "user"
        root_path
      when "agent"
        root_path
      when "moderator"   
        root_path 
      when "admin"
        admin_root_path
      else
      root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :name, :email, :dob, :avatar, :gender_id, :city_id, :role_id, :image])
  end

end
