class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    do_provider(:facebook)
  end

  def vkontakte
    do_provider(:vkontakte)
  end

  def odnoklassniki
    do_provider(:odnoklassniki)
  end

  def google_oauth2
    do_provider(:google)
  end

  def twitter
    do_provider(:twitter)
  end

  def mailru
    do_provider(:mailru)
  end

  def failure
    set_flash_message(:alert, :api_error)
    redirect_to root_path
  end

  def do_provider(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"], provider)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => provider.to_s.capitalize) if is_navigational_format?
    else
      session["devise.#{provider.to_s}_data"] = request.env["omniauth.auth"]
      if @user.email.empty?
        set_flash_message(:alert, :email_empty, kind: provider.to_s.capitalize )
      else
        set_flash_message(:alert, :name_exists, :kind => @user.name )
      end
      redirect_to new_user_registration_url
    end
  end
end