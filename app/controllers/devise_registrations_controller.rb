class DeviseRegistrationsController < Devise::RegistrationsController

  def new
    redirect_to root_path(act:'register')
  end

  def create
    super
  end

  def update
    super
  end

  def destroy
    super
  end

end