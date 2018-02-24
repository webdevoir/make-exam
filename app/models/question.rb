class Question < ApplicationRecord
	belongs_to :examination
	has_many :answers, dependent: :destroy

	accepts_nested_attributes_for :answers, allow_destroy: true

	validates_presence_of :body
	validates_presence_of :question_type
end
