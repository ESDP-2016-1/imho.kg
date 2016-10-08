class SessionsController < Devise::SessionsController
	respond_to :html, :json, :js

	def create
		super
		if resource.confirmed? && resource.sign_in_count == 1
			resource.active = true
			resource.save
	  	end 
	end
end
