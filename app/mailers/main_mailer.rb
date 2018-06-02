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
end
