class DeviseSessionsController < Devise::SessionsController

  def new
    redirect_to root_path(act:'sign_in')
  end

	def create
		super
		if resource.confirmed? && resource.sign_in_count == 1
			resource.active = true
			resource.save
		end
	end

	def destroy
		super
  end

end
