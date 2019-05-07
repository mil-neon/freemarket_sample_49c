class LikesController < ApplicationController
  before_action :set_variables
  def create
    @like = Like.new(user_id: session[:user_id], product_id: params[:product_id])
    @like.save
    @likes_count = Product.find_by(id: params[:product_id])
    redirect_to @product
  end

  def destroy
    @like = Like.find_by(user_id: session[:user_id], product_id: params[:product_id])
    @like.destroy
    redirect_to @product
  end

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
  end
end
