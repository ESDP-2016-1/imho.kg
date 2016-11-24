class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :load_js_files
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_categories



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

  def load_categories
    @categories = Category.preload(:subcategories)
  end

  def load_js_files
    @js_files=Array.new
    @js_files.push('application')

    case params[:controller]
      when 'main', 'ucomments'
        @js_files.push(params[:controller])
      when 'companies', 'users'
        @js_files.push('Chart.bundle')
        @js_files.push('chartkick')
        @js_files.push(params[:controller])
      when 'admin/dashboard'
        @js_files.push('active_admin.js.coffee')
    end
  end

  def load_css_files

  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :name, :email, :dob, :avatar, :gender_id, :city_id, :role_id, :image])
  end

end
