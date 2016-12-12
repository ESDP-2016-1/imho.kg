class CreateModerations < ActiveRecord::Migration
  def change
    create_table :moderations do |t|
      t.integer :company_id
      t.string :company_title
      t.string :company_occupation
      t.string :company_address
      t.string :company_phones
      t.integer :comment_rate
      t.string :comment_title
      t.text :comment_body
      t.boolean :comment_anonymous
      t.attachment :image1
      t.attachment :image2
      t.attachment :image3
      t.attachment :image4
      t.attachment :image5

      t.timestamps null: false
    end
  end
end
