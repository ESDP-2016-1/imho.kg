class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :gender, index: true, foreign_key: true
  end
end
