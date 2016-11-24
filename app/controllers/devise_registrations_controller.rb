class DeviseRegistrationsController < Devise::RegistrationsController

  def new
    redirect_to root_path(act:'register')
    #super

  end

  def create
    #redirect_to root_path(act:'register')
    super

  end

  def update
    #binding.pry
    super
  end

  def destroy
    binding.pry
    super
  end

  protected

  def update_resource(resource, params)
    #binding.pry
    resource.update_without_password(params)
  end

end