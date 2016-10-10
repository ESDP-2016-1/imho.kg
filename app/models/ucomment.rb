class Ucomment < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :company
  has_many :subucomments, class_name: "Ucomment", foreign_key: 'topucomment_id'

  belongs_to :topucomment, class_name: 'Ucomment'

  has_many :images
  has_many :favorites

end
