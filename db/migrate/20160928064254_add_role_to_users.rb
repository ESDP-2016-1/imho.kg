class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :role, index: true, foreign_key: true, default: '1'
  end
end
