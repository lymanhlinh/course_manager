Recaptcha.configure do |config|
  config.public_key  = ENV["recaptcha_publishable_key"]
  config.private_key = ENV["recaptcha_api_key"]
end
