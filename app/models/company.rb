class Company < ActiveRecord::Base
  searchkick match: :word_start, searchable: [:title]
  #searchkick

  belongs_to :city
  belongs_to :category

  has_many :ratings
  has_many :ucomments


  has_attached_file :image,
                    styles: { medium: '250x250>', thumb: '80x80>', icon: '50x50'},
                    default_url: '/images/:style/missing-for-company.png'
  validates_attachment_content_type :image,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']

  def total_positive
    self.ucomments.where(positive: true).count
  end

  def total_negative
    self.ucomments.where(positive: false).count
  end

end
