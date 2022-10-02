if Rails.env.development?

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            ENV["gmail_username"],
  password:             ENV["gmail_password"],
  authentication:       'plain',
  enable_starttls_auto: true 
}

elsif Rails.env.production?

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.sendgrid.net',
  port:                 587,
  domain:               'railway.app',
  user_name:            'apikey',
  password:             ENV["SENDGRID_API_KEY"],
  authentication:       'plain',
  enable_starttls_auto: true 
}

end
