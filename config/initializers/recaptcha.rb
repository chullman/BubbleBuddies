Recaptcha.configure do |config|
  if Rails.env.development?
    config.site_key = ENV['recaptcha_site_key_dev']
    config.secret_key = ENV['recpatcha_secret_key_dev']
  elsif Rails.env.production?
    config.site_key = ENV['recaptcha_site_key_prod']
    config.secret_key = ENV["recaptcha_secret_key_prod"]
  end
end