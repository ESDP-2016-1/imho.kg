class AddCityRefToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :city, index: true, foreign_key: true
  end
end
