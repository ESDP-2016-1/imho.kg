class DevisePasswordsController < Devise::PasswordsController
  prepend_before_action :require_no_authentication
  append_before_action :assert_reset_token_passed, only: :edit

  def new
    self.resource = resource_class.new
    session[:modal] = 'recovery'
    redirect_to root_path
  end

  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
    session[:modal] = 'recovery_new_password'
    session.delete(:usr_tk)
    session[:usr_tk] = resource.reset_password_token
    redirect_to root_path
  end


  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end


  # PUT /resource/password
  def update
    resource_params[:reset_password_token] << session[:usr_tk].to_s
    session.delete(:usr_tk)

    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
    else
      set_minimum_password_length
    end
    redirect_to root_path
  end

  protected
  def after_resetting_password_path_for(resource)
    Devise.sign_in_after_reset_password ? after_sign_in_path_for(resource) : new_session_path(resource_name)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    new_session_path(resource_name) if is_navigational_format?
  end

  # Check if a reset_password_token is provided in the request
  def assert_reset_token_passed
    if params[:reset_password_token].blank?
      set_flash_message(:alert, :no_token)
      redirect_to new_session_path(resource_name)
    end
  end

  # Check if proper Lockable module methods are present & unlock strategy
  # allows to unlock resource on password reset
  def unlockable?(resource)
    resource.respond_to?(:unlock_access!) &&
        resource.respond_to?(:unlock_strategy_enabled?) &&
        resource.unlock_strategy_enabled?(:email)
  end

  def translation_scope
    'devise.passwords'
  end


end