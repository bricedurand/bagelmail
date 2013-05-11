class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :phone_number, :address_street, :address_zipcode, :address_city, :address_country, :address_details, :public_id

  validates :firstname, presence: true, length: {minimum: 2, maximum: 255}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 255}
  validates :phone_number, presence: true, length: {minimum: 2, maximum: 255}
  has_many :mails

  def fullname
    "#{firstname} #{lastname}"
  end
end
