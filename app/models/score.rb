class Score < ApplicationRecord
  belongs_to :user
  belongs_to :examination
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses, allow_destroy: true
end
