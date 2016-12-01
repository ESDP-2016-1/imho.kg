class DeviseSessionsController < Devise::SessionsController
  prepend_before_action :require_no_authentication, only: [:new, :create]
  prepend_before_action :allow_params_authentication!, only: :create
  prepend_before_action :verify_signed_out_user, only: :destroy
  prepend_before_action only: [:create, :destroy] { request.env["devise.skip_timeout"] = true }


  def new
    session[:modal] = 'sign_in'
    redirect_to root_path
  end

  def create
    super
  end

  def destroy
    super
  end

end
