class Examination < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :answers, :through => :questions
  has_many :scores
  has_secure_password


  def self.search(search)
    where('name ILIKE :search OR intro ILIKE :search OR conclusion ILIKE :search', search: "%#{search}%")
  end

end
