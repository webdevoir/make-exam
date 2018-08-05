class AddStripeToPayment < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :stripe_card_token, :string
  end
end
