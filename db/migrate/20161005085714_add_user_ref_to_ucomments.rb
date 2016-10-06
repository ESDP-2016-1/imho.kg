class AddUserRefToUcomments < ActiveRecord::Migration
  def change
    add_reference :ucomments, :user, index: true, foreign_key: true
  end
end
