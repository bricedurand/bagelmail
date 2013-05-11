class UserMailer < ActionMailer::Base

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_mail.subject
  #
  def send_mail(user, mail)
    @user = user
    @mail = mail

    mail to: @user.email, subject: "[Bagel Mail] Nouveau courrier"
  end
end
