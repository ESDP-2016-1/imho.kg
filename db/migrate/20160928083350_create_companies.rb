class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.text :description
      t.string :address
      t.string :phones
      t.string :email
      t.string :website
      t.string :working_hours
      t.string :registration_year

      t.timestamps null: false
    end
  end
end
