class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :paypal_customer_token
      t.string :paypal_payment_token
      t.string :paypal_email
      t.ads :references

      t.timestamps
    end
  end
end
