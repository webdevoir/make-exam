class AddGenderToPlacement < ActiveRecord::Migration[5.1]
  def change
    add_column :placements, :gender, :string
  end
end
