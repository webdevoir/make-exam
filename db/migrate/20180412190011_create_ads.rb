class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.string :compname
      t.string :email
      t.string :contact
      t.string :phoneno
      t.string :countries
      t.string :months
      t.string :age
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
