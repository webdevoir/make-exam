class User < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :subscriptions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :age

  validates_presence_of :country

  validates_presence_of :firstname

  validates_presence_of :country


end
