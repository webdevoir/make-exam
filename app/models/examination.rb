class Examination < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_secure_password
end
