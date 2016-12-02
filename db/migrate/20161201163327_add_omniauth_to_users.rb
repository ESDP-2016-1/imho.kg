class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_uid, :string
    add_column :users, :vkontakte_uid, :string
    add_column :users, :odnoklassniki_uid, :string
    add_column :users, :twitter_uid, :string
    add_column :users, :google_uid, :string
    add_column :users, :mailru, :string
  end
end
