class AddCostToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :cost, :string
  end
end
