class UserMailer < ActionMailer::Base
  default :from => "brice.durand2@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_mail.subject
  #
  def send_mail(letter)
    @letter = letter

    mail to: @letter.user.email, subject: "[Bagel Mail] Nouveau courrier"
  end
end
