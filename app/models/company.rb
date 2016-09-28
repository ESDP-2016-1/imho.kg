class Company < ActiveRecord::Base
  has_many :ratings
  belongs_to :city

  belongs_to :category
end
