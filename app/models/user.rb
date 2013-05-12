class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:dropbox]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :phone_number, :address_street, :address_zipcode, :address_city, :address_country, :address_details, :public_id

  validates :firstname, presence: true, length: {minimum: 2, maximum: 255}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 255}
  validates :phone_number, presence: true, length: {minimum: 2, maximum: 255}

  has_many :letters


  def fullname
    "#{firstname} #{lastname}"
  end

  def self.find_for_dropbox_oauth(auth, signed_in_resource=nil)
    user = signed_in_resource
    user.dropbox_uid = auth.uid
    user.dropbox_token = auth.extra.access_token.token
    user.dropbox_secret = auth.extra.access_token.secret
    user.save!
    user
  end
end
