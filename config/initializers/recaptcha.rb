Recaptcha.configure do |config|
  if Rails.env.development?
    config.site_key = "6LcsJ1cUAAAAACFEL6Iw9X3XHqnl0HHpCHdM5YQm"
    config.secret_key = "6LcsJ1cUAAAAAKzFgdbc2grwWlsW4QDGgcuuKSPj"
  elsif Rails.env.production?
    config.site_key = "6LcKLFcUAAAAADk8IzYsGnhYjtifkngbPuObxyyZ"
    config.secret_key = "6LcKLFcUAAAAAOY5n0Vo-c65qMxfRMwfcTGIw5AV"
  end
end