class Examination < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_secure_password
end
