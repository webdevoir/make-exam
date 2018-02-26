class Response < ApplicationRecord
  belongs_to :score
  belongs_to :answer
  belongs_to :question
end
