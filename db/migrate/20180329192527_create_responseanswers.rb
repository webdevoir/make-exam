class CreateResponseanswers < ActiveRecord::Migration[5.1]
  def change
    create_table :responseanswers do |t|
      t.references :response, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
