class Company < ActiveRecord::Base
  has_many :ratings
  belongs_to :city
  has_many :ucomments


  belongs_to :category
  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']


end
