class AddStatusToAds < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :status, :string
  end
end
