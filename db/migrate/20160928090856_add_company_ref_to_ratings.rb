class AddCompanyRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :company, index: true, foreign_key: true
  end
end
