ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :email, :fullname, :password, :password_confirmation, :role_id, :dob, :active, :city_id, :avatar
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form do |f|
    f.inputs do
      f.input :name
      f.input :fullname
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role
      f.input :dob
      f.input :active
      f.input :city
      f.input :avatar, :as => :file, :hint => image_tag(f.object.avatar.url(:thumb))
    end
    f.actions
  end

  show do
    attributes_table do
      row :avatar do |user|
        image_tag user.avatar.url(:medium)
      end
      row :name
      row :fullname
      row :email
      row :role
      row :dob
      row :active
      row :city
    end
    active_admin_comments
  end

  index do
    selectable_column
    id_column
    column :avatar do |user|
      image_tag user.avatar.url(:thumb)
    end
    column :name do |user|
      link_to user.name, admin_user_path(user)
    end
    column :fullname
    column :email
    column :role
    column :city
    column :dob
    column :active
    column :last_sign_in_at
    actions
  end


end
