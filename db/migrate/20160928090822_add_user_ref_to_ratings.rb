class AddUserRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :user, index: true, foreign_key: true
  end
end
