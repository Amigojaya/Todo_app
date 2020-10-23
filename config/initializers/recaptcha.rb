Recaptcha.configure do |config|
  config.site_key    = ENV['SITE_KEY']
  config.secret_key  = ENV['SECRET_KEY'] 
end