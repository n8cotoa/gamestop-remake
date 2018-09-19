class ChargesController < ApplicationController
  def new
    @order = current_order
    @amount = @order.total_price
    @charge = @amount * 100
  end

  def create
    # Amount in cents
    @order = current_order
    @amount = @order.total_price * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount.round,
      :description => 'Better Gamestop Customer',
      :currency    => 'usd'
    )
  if charge[:paid]
    @order.status = "Paid"
    @order.save
  end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
