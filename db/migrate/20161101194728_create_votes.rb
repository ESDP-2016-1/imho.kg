class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_liked
      t.references :user, index: true, foreign_key: true
      t.references :ucomment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
