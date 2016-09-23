class AddSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :boolean, default: nil
  end
end
