class AddStripeToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :stripe_card_token, :string
  end
end
