class MainMailer < ApplicationMailer

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

  def ad_paid(payment)
    @payment = payment
    mail(to: 'admin@makeanexam.com', subject: 'Ad Created')
  end
end
