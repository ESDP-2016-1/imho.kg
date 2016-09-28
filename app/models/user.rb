class User < ActiveRecord::Base
  belongs_to :gender
  belongs_to :city
  belongs_to :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name, presence: true, length: {maximum: 50}

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: ':style/missing.png'
  validates_attachment :avatar,
                       content_type: { content_type: %w( image/jpeg image/jpg image/gif image/png) }




end
