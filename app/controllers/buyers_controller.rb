class BuyersController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @buyer = User.find(session[:user_id])
    card = Credit.where(user_id: @buyer.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if card != nil
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      session[:buyer_id] = @buyer.id
      session[:price] = @product.price
      session[:product_id] = @product.id
    else
      redirect_to new_signup_pay_path, notice: 'クレジットカードを登録してください'
    end
  end

  def index; end
end
