ActiveAdmin.register Category do

  action_item :create_subdirectory, only: :index do
    link_to "Создать SubCategory", new_admin_subcategory_path
  end

  permit_params :title, :description, :topcategory_id


  form do |f|

    if !category.id.nil? 

      f.inputs "Top category" do
        f.input :topcategory
        f.input :description, :input_html => { :rows => 4}
      end    

       
      f.inputs "Sub category" do
               
        f.input :title
        f.input :description, :input_html => { :rows => 4}
      end

    else  
     
      f.inputs "Top category" do
        f.input :title
        f.input :description, :input_html => { :rows => 4}
      end
       
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
    column :topcategory
    column :subcategories do |category|
      if category.subcategories.present?
        name = ""
        category.subcategories.each do |subcat|
          name += subcat.title + ", "
        end  
        name.chomp(", ")      
      end
    end
    actions
  end

  show do
    attributes_table do
      row :title
      row :description
      row :topcategory
      row :subcategories do |category|
        if category.subcategories.present?
          name = ""
          category.subcategories.each do |subcat|
            name += subcat.title + ", "
          end  
          name.chomp(", ")      
        end
      end
    end
    active_admin_comments
  end


end
