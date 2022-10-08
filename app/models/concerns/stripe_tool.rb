module StripeTool
  def self.create_customer(email:, stripe_token:)
    Stripe::Customer.create(
      email: email,
      source: stripe_token,
    )
  end

  def self.create_charge(customer_id:, amount:, description:, currency: "aud")
    Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: currency,
    )
  end
end
