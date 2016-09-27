class AddCityToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :city, index: true, foreign_key: true
  end
end
