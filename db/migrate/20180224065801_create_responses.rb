class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      # t.references :answer, foreign_key: true
      t.text :answer_ids
      t.references :score, foreign_key: true
      t.references :question
      t.timestamps
    end
  end
end
