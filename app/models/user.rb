class User < ActiveRecord::Base
  #before_update :check_fileds, :if => path

  #acts_as_voter
  belongs_to :gender
  belongs_to :city
  belongs_to :role
  has_many :ratings
  has_many :ucomments
  has_many :favorites
  has_many :votes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum: 50}

  validates :email, presence: true, uniqueness: true

  #validates :password, presence: true, length: {minimum: 6, maximum: 250}

  has_attached_file :avatar,
                    styles: { medium: '250x250>', thumb: '80x80', icon: '50x50'},
                    default_url: ':style/missing.png'

  validates_attachment :avatar,
                       content_type: { content_type: %w( image/jpeg image/jpg image/gif image/png) }

  def apply_updates(parameters, active_user, received_password)

    if active_user.valid_password?(received_password)

    self.assign_attributes(parameters)

      if self.changed?
        if self.update_attributes!(parameters)
          return true
        end
      end

    end

  end

  protected



end
