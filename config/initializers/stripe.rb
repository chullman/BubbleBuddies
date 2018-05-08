Rails.configuration.stripe = {
    :publishable_key => ENV['stripe_public_key'],
    :secret_key      => ENV['stripe_private_key']
}

Stripe.api_key = ENV['stripe_private_key']