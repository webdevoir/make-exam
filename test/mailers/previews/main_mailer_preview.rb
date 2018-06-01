# Preview all emails at http://localhost:3000/rails/mailers/main_mailer
class MainMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    MainMailer.sample_email(User.first)
  end

  def ad_paid_preview
    MainMailer.ad_paid(Payment.last)
  end
end