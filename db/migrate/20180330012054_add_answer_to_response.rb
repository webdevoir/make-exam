class AddAnswerToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :answer, :text
  end
end
