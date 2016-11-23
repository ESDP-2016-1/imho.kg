class AddDeletedToUcomments < ActiveRecord::Migration
  def change
    add_column :ucomments, :deleted, :boolean, default: false
  end
end
