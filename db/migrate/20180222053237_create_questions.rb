class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :examination, foreign_key: true
      t.integer :points
      t.string :type
      t.text :body
      t.integer :position

      t.timestamps
    end
  end
end
