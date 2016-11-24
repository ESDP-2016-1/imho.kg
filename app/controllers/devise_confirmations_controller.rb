class DeviseConfirmationsController < Devise::ConfirmationsController

  def new
    super
  end

  def show
    super
    #binding.pry
    #redirect_to root_path(act: "sign_in")
  end

  def create
    super
  end


end