class CreateUcomments < ActiveRecord::Migration
  def change
    create_table :ucomments do |t|
      t.text :body
      t.boolean :anonymous
      t.boolean :positive
      t.integer :rate

      t.timestamps null: false
    end
  end
end
