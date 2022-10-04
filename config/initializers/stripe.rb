require 'stripe'

Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.dig(:STRIPE_PUBLIC_KEY) || ENV['STRIPE_PUBLIC_KEY']
    :secret_key      => Rails.application.credentials.dig(:STRIPE_PRIVATE_KEY) || ENV['STRIPE_PRIVATE_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]