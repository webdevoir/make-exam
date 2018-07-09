class CreateJoinTableAdPlacement < ActiveRecord::Migration[5.1]
  def change
    create_join_table :ads, :placements do |t|
      t.index [:ad_id, :placement_id]
      t.index [:placement_id, :ad_id]
    end
  end
end
