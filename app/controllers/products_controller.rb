class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @user = User.find(1)
    @product = Product.find(10)
    @images = @product.images.pluck("image")
  end
end
