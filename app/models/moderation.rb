class Moderation < ActiveRecord::Base
  has_many :users
  has_attached_file :image1,
                    url: '/images/moderate/:id/:id_:filename'
  has_attached_file :image2,
                    url: '/images/moderate/:id/:id_:filename'
  has_attached_file :image3,
                    url: '/images/moderate/:id/:id_:filename'
  has_attached_file :image4,
                    url: '/images/moderate/:id/:id_:filename'
  has_attached_file :image5,
                    url: '/images/moderate/:id/:id_:filename'



  validates_attachment :image1,
                       content_type: {
                           content_type: ['image/jpeg', 'image/gif', 'image/png']
                       },
                       size: { in: 0..500.kilobytes }

  validates_attachment :image2,
                       content_type: {
                           content_type: ['image/jpeg', 'image/gif', 'image/png']
                       },
                       size: { in: 0..500.kilobytes }

  validates_attachment :image3,
                       content_type: {
                           content_type: ['image/jpeg', 'image/gif', 'image/png']
                       },
                       size: { in: 0..500.kilobytes }

  validates_attachment :image4,
                       content_type: {
                           content_type: ['image/jpeg', 'image/gif', 'image/png']
                       },
                       size: { in: 0..500.kilobytes }

  validates_attachment :image5,
                       content_type: {
                           content_type: ['image/jpeg', 'image/gif', 'image/png']
                       },
                       size: { in: 0..500.kilobytes }

end
