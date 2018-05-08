ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'your-app-name.herokuapp.com',
  user_name:            ENV["gmail_username"],
  password:             ENV["gmail_password"],
  authentication:       'plain',
  enable_starttls_auto: true 
}