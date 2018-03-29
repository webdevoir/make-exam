class Response < ApplicationRecord
  belongs_to :score
  # belongs_to :answer
  belongs_to :question
  has_many :responseanswers
  has_many :answers, through: :responseanswers

  serialize :answer_ids
end
