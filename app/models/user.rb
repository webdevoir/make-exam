class User < ApplicationRecord
  has_many :examinations, dependent: :destroy
  has_many :scores, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
