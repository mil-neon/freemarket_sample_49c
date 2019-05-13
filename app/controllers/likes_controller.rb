class LikesController < ApplicationController
  before_action :set_variables
  def create
    @like = Like.create(user_id: session[:user_id], product_id: params[:product_id])
    @product.reload
  end

  def destroy
    @like = Like.find_by(user_id: session[:user_id], product_id: params[:product_id])
    @like.destroy
    @product.reload
  end

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end