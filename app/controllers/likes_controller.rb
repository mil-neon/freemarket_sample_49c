class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: session[:user_id], product_id: params[:product_id])
    @like.save
    redirect_to("/products/#{params[:product_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: session[:user_id], product_id: params[:product_id])
    @like.destroy
    redirect_to("/products/#{params[:product_id]}")
  end
end
