class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.references :topcategory, index: true
      t.timestamps null: false
    end
    #add_reference :categories, :topcategory, index: true
    add_foreign_key :categories, :categories, column: :topcategory_id
  end
end
