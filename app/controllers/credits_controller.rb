class CreditsController < ApplicationController
  require "payjp"
  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to new_signup_pay_path
    else
      customer = Payjp::Customer.create(card: params['payjp-token'], metadata: {user_id: session[:user_id]})
      @card = Credit.new(user_id: session[:user_id], customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to new_complete_path
      else
        redirect_to new_signup_pay_path
      end
    end
  end

  def pay
    card = Credit.where(user_id: session[:user_id]).first
    @buyer = User.find(session[:user_id])
    if card.blank?
      redirect_to new_signup_pay_path
    else
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      @pay = Payjp::Charge.create(amount: session[:price], customer: card.customer_id, currency: 'jpy')
      if @pay
        @product = Product.find(session[:product_id])
        @product.update(buyer_id: session[:buyer_id], status: 2)
        redirect_to buyers_path
      else
        redirect_to buyer_path(@buyer), notice: '購入に失敗しました'
      end
    end
  end
end
