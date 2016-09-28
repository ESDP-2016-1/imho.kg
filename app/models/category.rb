class Category < ActiveRecord::Base
	has_many :subcategories, class_name: "Category",
							foreign_key: "topcategory_id"

	belongs_to :topcategory, class_name: "Category"

	has_many :companies
end
