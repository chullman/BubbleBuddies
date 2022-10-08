class ChargesController < ApplicationController
  def new
  end

  def confirmation
    render :layout => "create_charge_layout"
  end

  def create
    @price = convert_price_to_cents(Meetup.find(params[:id]).price).to_i

    customer = StripeTool.create_customer(email: current_user.email,
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @price,
                                      description: "BubbleBuddies Customer")

    redirect_to charges_confirmation_path(params[:id])
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def convert_price_to_cents(price)
    price * 100
  end
end
