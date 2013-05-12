Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_API_KEY']
  config.secret_key = ENV['MAILJET_SECRET_KEY']
  config.default_from = 'brice.durand2@gmail.com'
  config.domain = "mailoffice.me"
end