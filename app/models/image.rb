class Image < ActiveRecord::Base
	belongs_to :ucomment

	has_attached_file :picture,
                    styles: { medium: '300x300>', thumb: '100x100>'}

  validates_attachment_content_type :picture,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']
end
