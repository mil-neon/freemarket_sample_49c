class ProductsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @user = User.find(1)
    @products = Product.find(1)
    @images = @products.images.pluck("image")
  end
end
