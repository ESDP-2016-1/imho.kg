class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, presence: true, length: {maximum: 50}
  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: ':style/missing.png'
  validates_attachment_content_type :avatar,
                                    content_type: ['image/jpeg', 'image/gif', 'image/png']

end
