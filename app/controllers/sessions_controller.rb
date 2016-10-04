class SessionsController < Devise::SessionsController
	respond_to :html, :json, :js
end
