class AddPagesToAd < ActiveRecord::Migration[5.1]
  def change
    add_column :ads, :pages, :string
  end
end
