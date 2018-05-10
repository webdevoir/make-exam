class User < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :subscriptions
  has_many :posts
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, authentication_keys: [:login]

  validates_presence_of :age

  validates_presence_of :country

  validates_presence_of :firstname

  validates_presence_of :country

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  validate :validate_username

	def validate_username
	  if User.where(email: username).exists?
	    errors.add(:username, :invalid)
	  end
	end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_hash).first
      end
    end


end
