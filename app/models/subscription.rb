class Subscription < ApplicationRecord
  belongs_to :user

  validates_presence_of :paypal_customer_token, :message => "PayPal payment must be complete" 
  validates_presence_of :paypal_payment_token, :message => "PayPal payment must be complete"  
  validates_presence_of :paypal_email, :message => "PayPal payment must be complete" 

end
