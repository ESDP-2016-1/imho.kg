ActiveAdmin.register Company do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :description, :image, :city_id, :address,
                :phones, :email, :website, :working_hours, :registration_year,
                :category_id


  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url(:thumb))
      f.input :city
      f.input :category
      f.input :address
      f.input :phones
      f.input :email
      f.input :website
      f.input :working_hours
      f.input :registration_year
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :image do |company|
      image_tag company.image.url(:thumb)
    end
    column :title do |company|
      link_to company.title, admin_company_path(company)
    end
    column :description
    column :city
    column :category
    column :address
    column :phones
    column :email
    column :website
    column :working_hours
    column :registration_year
    column :image
    actions
  end

  show do
    attributes_table do
      row :image do |company|
        image_tag company.image.url(:medium)
      end
      row :title
      row :description
      row :city
      row :category
      row :address
      row :phones
      row :email
      row :website
      row :working_hours
      row :registration_year
    end
    active_admin_comments
  end


end
