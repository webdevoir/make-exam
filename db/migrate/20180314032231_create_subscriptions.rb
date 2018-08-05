class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.string :paypal_customer_token
      t.string :paypal_payment_token
      t.string :paypal_email
      t.datetime :expiry

      t.timestamps
    end
  end
end
