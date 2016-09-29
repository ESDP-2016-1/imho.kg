ActiveAdmin.register City do

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

    column :name do |city|
      link_to city.name, admin_city_path(city)
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
