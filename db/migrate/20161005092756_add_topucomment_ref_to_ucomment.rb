class AddTopucommentRefToUcomment < ActiveRecord::Migration
  def change
    add_reference :ucomments, :topucomment, index: true, foreign_key: true
  end
end
