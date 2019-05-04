class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.new(user_id: session[:user_id], product_id: params[:product_id])
    @like.save
    redirect_to @product
  end

  def destroy
    @like = Like.find_by(user_id: session[:user_id], product_id: params[:product_id])
    @like.destroy
    redirect_to @product
  end

  private

  def set_variables
    @product = Product.find(params[:product_id])
  end
end
