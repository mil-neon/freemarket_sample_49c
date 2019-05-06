class ProductsController < ApplicationController
  def index
    @lady = Category.find(1)
    @ladies = Product.recent_category(1)
    @men = Category.find(2)
    @mens = Product.recent_category(2)
    @baby = Category.find(3)
    @babys = Product.recent_category(3)
    @good = Category.find(4)
    @goods = Product.recent_category(4)

    @Vuitton = Brand.find(1244)
    @Vuittons = Product.recent_brand(1244)
    @chanerl = Brand.find(1242)
    @chanerls = Product.recent_brand(1242)
    @nike = Brand.find(1243)
    @nikes = Product.recent_brand(1243)
    @syupu = Brand.find(1245)
    @syupus = Product.recent_brand(1245)
  end

  def new
    @product = Product.new
    @product.images.build
    @categories = Category.ransack(parent_id_null: true).result
  end

  def create
    @product = Product.new(product_params)
    @categories = Category.ransack(parent_id_null: true).result
    respond_to do |format|
      params[:images_attributes]['image'].each do |i|
        @product.images.new(image: i)
      end
      if @product.save
        format.json
      else
        render :new
      end
    end
  end

  def show
    @user = User.find(1)
    @products = Product.find(1)
    @images = @products.images.pluck("image")
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :brand_id, :size, :condition, :shipping_feeh, :shipping_method, :prefecture_id, :shipping_date, :price, images_attributes: [:image]).merge(seller_id: session[:user_id])
  end
end
