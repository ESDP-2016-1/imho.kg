class AddTopcategoryRefToCategories < ActiveRecord::Migration
  def change
    add_reference :categories, :topcategory, index: true, foreign_key: true
  end
end
