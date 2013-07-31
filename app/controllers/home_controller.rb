class HomeController < ApplicationController
  def index
  end

  def charge
  end

  def process_card
    charge = Stripe::Charge.create(amount: 5000, card: params[:token], currency: 'usd', description: "charge in order to buy ice-cream")
    render json: charge.to_json
  end
end
