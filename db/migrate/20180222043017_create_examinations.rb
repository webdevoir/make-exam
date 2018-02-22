class CreateExaminations < ActiveRecord::Migration[5.1]
  def change
    create_table :examinations do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :password_digest
      t.text :intro
      t.text :conclusion
      t.string :passcode

      t.timestamps
    end
  end
end
