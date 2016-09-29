ActiveAdmin.register Category do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :description, :subcategory


  form do |f|
    f.inputs "Categories" do
      f.input :title
      f.input :description
      f.input :topcategory
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title do |category|
      link_to category.title, admin_category_path(category)
    end
    column :description
    column :subcategory
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :subcategory
    end
    active_admin_comments
  end


end
