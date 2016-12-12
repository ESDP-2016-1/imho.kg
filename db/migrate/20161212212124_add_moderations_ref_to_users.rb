class AddModerationsRefToUsers < ActiveRecord::Migration
  def change
    add_reference :moderations, :user, index:true, foreign_key: true
  end
end
