class AddCompanyRefToUcomments < ActiveRecord::Migration
  def change
    add_reference :ucomments, :company, index: true, foreign_key: true
  end
end
