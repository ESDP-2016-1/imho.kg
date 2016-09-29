class Adapters::OnlyAdmins < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    user.role.name == 'admin'
  end

end
