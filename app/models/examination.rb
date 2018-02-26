class Examination < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, :through => :questions
  has_many :scores
  has_secure_password

end
