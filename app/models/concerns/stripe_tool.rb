module StripeTool
  def self.create_customer(email: email_address, stripe_token: stripe_token_value)
    Stripe::Customer.create(
      email: email_address,
      source: stripe_token_value
    )
  end

  def self.create_charge(customer_id: customer_id_value, amount: amount_value, description: description_value)
    Stripe::Charge.create(
      customer: customer_id_value,
      amount: amount_value,
      description: description_value,
      currency: 'aud'
    )
  end
end