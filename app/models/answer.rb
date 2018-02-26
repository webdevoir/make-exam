class Answer < ApplicationRecord
	belongs_to :question
	has_many :responses, dependent: :destroy

	# validates_presence_of :question_id

end
