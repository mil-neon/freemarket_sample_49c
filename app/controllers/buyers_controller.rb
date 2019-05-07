class BuyersController < ApplicationController
  def show
    @product = Product.find(params[:id])
    # 商品詳細完成次第解放
    # @buyer = @user.find(session[:user_id])
    #仮置きです↓
    @buyer = User.find(21)
    card = Credit.where(user_id: @buyer.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
    session[:buyer_id] = @buyer.id
    session[:price] = @product.price
    session[:product_id] = @product.id
  end

  def index
  end
end
