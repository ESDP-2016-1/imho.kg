class Category < ActiveRecord::Base
	belongs_to :topcategory, class_name: "Category"

	has_many :subcategories, class_name: "Category",
					 foreign_key: "topcategory_id"

	has_many :companies

	validates :title, uniqueness: true, length: { maximum: 30}
end
