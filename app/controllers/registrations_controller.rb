class RegistrationsController < Devise::RegistrationsController
	respond_to :html, :json, :js
end
