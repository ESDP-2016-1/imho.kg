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
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook, :vkontakte, :odnoklassniki, :google_oauth2, :twitter, :mailru]

  validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum: 50}

  validates :email, presence: true, uniqueness: true

  #validates :password, presence: true, length: {minimum: 6, maximum: 250}

  has_attached_file :avatar,
                    styles: { medium: '250x250>', thumb: '80x80', icon: '50x50'},
                    default_url: ':style/missing.png'

  validates_attachment :avatar,
                       content_type: { content_type: %w( image/jpeg image/jpg image/gif image/png) }



  def apply_updates(parameters, is_password_valid)
    if is_password_valid
      self.assign_attributes(parameters)
        if self.changed?
          if self.update_attributes!(parameters)
            return true
          end
        end
    end
  end


  # OmniAuth
  def self.from_omniauth(auth, provider)
    #binding.pry
    if auth.info.email
      user = where(:"#{provider}_uid" => auth.uid).first
      return user if user

      if (user = where(email: auth.info.email).first)
          if user.apply_updates({ :"#{provider}_uid" => auth.uid}, true)
            return user
          end
      else
        where( :"#{provider}_uid" => auth.uid).first_or_create do |new_user|
          new_user.email = auth.info.email
          new_user.password = Devise.friendly_token[0,20]
          new_user.name = fill_name_if_not_valid(auth.info.name)   # assuming the user model has a name
          #user.image = auth.info.image # assuming the user model has an image
          new_user.confirmed_at = Time.now
        end
      end
    else
      new
    end
  end


  def self.fill_name_if_not_valid(name)
    if name.length < 3
      while name.length < 3 do
        name << '.'
      end
    end
    name
  end
=begin
  def self.new_with_session(params, session)
    binding.pry
    super.tap do |user|
      if (data = session["devise.facebook_data"]) && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
=end
  # END OmniAuth



end
