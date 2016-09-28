class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :role, index: true, foreign_key: true, default: :role_id
  end
end
