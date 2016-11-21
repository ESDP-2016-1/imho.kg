class User < ActiveRecord::Base
  #acts_as_voter
  belongs_to :gender
  belongs_to :city
  belongs_to :role
  has_many :ratings
  has_many :ucomments
  has_many :favorites
  has_many :votes
  # before_create :set_default_role
  # or
  # before_validation :set_default_role


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}

  validates :email, presence: true, uniqueness: true

  has_attached_file :avatar,
                    styles: { medium: '250x250>', thumb: '80x80', icon: '50x50'},
                    default_url: ':style/missing.png'

  validates_attachment :avatar,
                       content_type: { content_type: %w( image/jpeg image/jpg image/gif image/png) }


  private

  # def set_default_role
  #   self.role ||= Role.find_by(name: 'user')
  # end

end
