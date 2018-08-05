class MainMailer < ApplicationMailer

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

  def ad_paid(payment)
    @payment = payment
    mail(to: 'admin@makeanexam.com', subject: 'Ad Created')
  end

  def ad_pay_request(ad)
    @ad = ad
    mail(to: ad.email, subject: 'Please Pay for your Ad at makeanexam.com')
  end

  def contact_me(message)
    @greeting = "Hi"
    @body = message.body
    @email = message.email
    @name = message.name
    mail to: "admin@makeanexam.com", from: "admin@makeanexam.com"
  end
end
