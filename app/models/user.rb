class User < ActiveRecord::Base
  #acts_as_voter
  belongs_to :gender
  belongs_to :city
  belongs_to :role
  has_many :ratings
  has_many :ucomments
  has_many :favorites
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}

  validates :email, presence: true, uniqueness: true

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>'},
                    default_url: ':style/missing.png'
  validates_attachment :avatar,
                       content_type: { content_type: %w( image/jpeg image/jpg image/gif image/png) }

end
