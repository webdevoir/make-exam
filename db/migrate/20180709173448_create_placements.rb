class CreatePlacements < ActiveRecord::Migration[5.1]
  def change
    create_table :placements do |t|
      t.string :country
      t.string :month
      t.string :age
      t.string :page

      t.timestamps
    end
  end
end
