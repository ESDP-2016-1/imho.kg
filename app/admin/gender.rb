ActiveAdmin.register Gender do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name
#
# or
#
  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  index do
    selectable_column
    id_column

    column :name do |gender|
      link_to gender.name, admin_gender_path(gender)
    end
    actions
  end

  show do
    attributes_table do
      row :name
    end
    active_admin_comments
  end


end
