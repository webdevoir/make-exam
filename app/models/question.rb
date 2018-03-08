class Question < ApplicationRecord
	belongs_to :examination
	has_many :answers, dependent: :destroy
	has_many :responses

	accepts_nested_attributes_for :answers, allow_destroy: true, :reject_if => :all_blank

	validates_presence_of :body
	validates_presence_of :question_type

	validate :has_correct_ans?

	 private

	 def has_correct_ans?
	  errors.add(:correct, "You must select at least one correct answer") unless
	  answers.map{ |x| x[:correct]}.include? true

	 end
end
