class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_action :load_js_files
  before_filter :store_current_location, :unless => :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :load_categories


  def load_categories
    @categories = Category.preload(:subcategories)
  end

  def load_js_files
    @js_files=Array.new
    @js_files.push('application')

    case params[:controller]
      when 'main', 'ucomments'
        @js_files.push(params[:controller])
        @js_files.push 'votable' if current_user
      when 'companies', 'users'
        @js_files.push('Chart.bundle')
        @js_files.push('chartkick')
        @js_files.push(params[:controller])
      when 'admin/dashboard'
        @js_files.push('active_admin.js.coffee')
    end
  end


  private

  #Override Devise methods
  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
 #############################



  def access_denied(exception)
    flash[:danger] = exception.message
    redirect_to root_url
  end




  protected


  #Devise sanitizer for params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :name)
    end
  end



end
