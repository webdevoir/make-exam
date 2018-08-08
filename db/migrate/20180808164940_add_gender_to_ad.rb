class AdGenderToAd < ActiveRecord::Migration[5.1]
  def change
  	add_column :ads, :gender, :string
  end
end
