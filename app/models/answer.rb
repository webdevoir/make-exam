class Answer < ApplicationRecord
	belongs_to :question
	# has_many :responses, dependent: :destroy
	has_many :responses, through: :responseanswers

end
