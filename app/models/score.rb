class Score < ApplicationRecord
  belongs_to :user
  belongs_to :examination
  has_many :responses, dependent: :destroy

  accepts_nested_attributes_for :responses, allow_destroy: true, 
  # :reject_if => :all_blank
  # :reject_if => proc {|att| att.fetch("answer_id").length < 0}
  reject_if: :no_answer_id? 

  private

 def no_answer_id?(att)
  att['answer_ids'].blank?
 end
end
