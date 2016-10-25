class AddTitleToUcomments < ActiveRecord::Migration
  def change
    add_column :ucomments, :title, :string
  end
end
