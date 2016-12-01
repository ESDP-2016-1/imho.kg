class DeviseSessionsController < Devise::SessionsController

  def new
		session[:modal] = 'sign_in'
    redirect_to root_path
  end


end
