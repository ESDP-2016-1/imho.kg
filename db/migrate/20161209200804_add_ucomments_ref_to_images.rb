class AddUcommentsRefToImages < ActiveRecord::Migration
  def change
    add_reference :images, :ucomment, index: true, foreign_key: true
  end
end
