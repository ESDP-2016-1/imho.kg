class AddUcommentRefToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :ucomment, index: true, foreign_key: true
  end
end
