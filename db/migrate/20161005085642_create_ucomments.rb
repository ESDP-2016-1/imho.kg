class CreateUcomments < ActiveRecord::Migration
  def change
    create_table :ucomments do |t|
      t.text :body
      t.boolean :anonymous
      t.boolean :positive
      t.integer :rate
      t.references :topucomment, index: true

      t.timestamps null: false
    end
    add_foreign_key :ucomments, :ucomments, column: :topucomment_id
  end
end
