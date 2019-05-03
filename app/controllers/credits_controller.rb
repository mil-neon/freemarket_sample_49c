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
end
