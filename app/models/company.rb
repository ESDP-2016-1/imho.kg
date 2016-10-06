class Company < ActiveRecord::Base
  belongs_to :city
  belongs_to :category

  has_many :ratings
  has_many :ucomments
  
  has_attached_file :image,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']


end
