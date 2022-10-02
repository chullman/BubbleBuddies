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
  address:              'in-v3.mailjet.com',
  port:                 587,
  domain:               'railway.app',
  user_name:            ENV["MAILJET_API_KEY"],
  password:             ENV["MAILJET_SECRET_KEY"],
  authentication:       'plain',
  enable_starttls_auto: true 
}

end
