class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?





  def access_denied(exception)
    flash[:danger] = exception.message
    redirect_to root_url
  end



  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :dob, :avatar, :gender_id, :city_id, :role_id])
  end

end
