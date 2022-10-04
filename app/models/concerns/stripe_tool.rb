module StripeTool
  def self.create_customer(email: email_address, stripe_token: stripe_token)
    Stripe::Customer.create(
      email: email_address,
      source: stripe_token
    )
  end

  def self.create_charge(customer_id: customer_id, amount: amount, description: description)
    Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: 'aud'
    )
  end
end