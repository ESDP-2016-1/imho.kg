class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :load_js_files
  before_filter :store_current_location, :unless => :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :load_categories


  def load_categories
    @categories = Category.preload(:subcategories)
  end

  def load_js_files
    @js_files=Array.new
    @js_files.push 'application'

    controller_js = params[:controller]
    case controller_js

      when 'main'
        @js_files.push 'stars'
        @js_files.push controller_js
        @js_files.push 'shareable'
        @js_files.push 'votable' if current_user

      when 'ucomments'
        @js_files.push 'stars'
        @js_files.push controller_js
        @js_files.push 'ckeditor'
        @js_files.push 'shareable'
        @js_files.push 'votable' if current_user
        @js_files.push 'add_comment' if params[:action]=='new'


      when 'companies', 'users'
        @js_files.push controller_js
        @js_files.push 'Chart.bundle'
        @js_files.push 'chartkick'
        @js_files.push 'shareable'

      when 'admin/dashboard'
        @js_files.push('active_admin.js.coffee')
    end
    @js_files
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


  def params_sanitizer(*keys)

  end

  def get_comment_from_params
    return unless current_user
    comment = Ucomment.find(params[:comment_id])
  end


  protected


  #Devise sanitizer for params
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :name)
    end
  end



end
