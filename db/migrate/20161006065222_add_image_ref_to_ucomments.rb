class AddImageRefToUcomments < ActiveRecord::Migration
  def change
    add_reference :ucomments, :image, index: true, foreign_key: true
  end
end
