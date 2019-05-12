class ChatsController < ApplicationController
  def create
    if session[:user_id]
      @chat = Chat.create(chat_params)
      @product = Product.find(params[:product_id])
      @seller = User.find_by(id: @product.seller_id)
      respond_to do |format|
        format.json
      end
    else
      redirect_to new_login_path
    end
  end

  private

  def chat_params
    params.permit.merge(comment: params[:comment][0], user_id: session[:user_id], product_id: params[:product_id])
  end
end
