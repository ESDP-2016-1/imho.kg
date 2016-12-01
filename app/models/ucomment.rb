class Ucomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :subucomments, class_name: "Ucomment", foreign_key: 'topucomment_id'

  belongs_to :topucomment, class_name: 'Ucomment'

  has_many :images
  has_many :favorites
  has_many :votes

  self.per_page = 10

end
