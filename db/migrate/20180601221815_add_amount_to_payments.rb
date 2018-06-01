class AddAmountToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :amount, :string
  end
end
