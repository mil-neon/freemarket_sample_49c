class UsersController < ApplicationController
  before_action :set_user

  def new
    session[:nickname] = nil
    session[:email] = nil
    session[:password] = nil
    session[:password_confirmation] = nil
    session[:firstname_fullangle] = nil
    session[:lastname_fullangle] = nil
    session[:firstname_kana] = nil
    session[:lastname_kana] = nil
    session[:postal_cord] = nil
    session[:city] = nil
    session[:address_number] = nil
  end

  def login
  end

  def mypage
    @products_buy = Product.where(buyer_id: session[:user_id])
    @products_buy_now = @products_buy.where(status: 2)
    @products_buy_close = @products_buy.where(status: 3)
    @products_sell = Product.where(seller_id: session[:user_id])
    @products_sell_now = @products_sell.where(status: 2)
    @products_sell_close = @products_sell.where(status: 3)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def signout
  end

  def update_user
    if @user.update_attributes(update_params)
      redirect_to mypage_path
    else
      render edit_edit_user_path
    end
  end

  def edit_user
  end

  def update_profile
    if @user.update_attributes(update_params)
      redirect_to mypage_path
    else
      render edit_edit_profile_path
    end
  end

  def edit_profile
  end

  def set_user
    @user = User.find(session[:user_id]) if session[:user_id] != nil
  end

  private

  def update_params
    params.permit(:nickname, :firstname_fullangle, :lastname_fullangle, :firstname_kana, :lastname_kana, :birthday, :postal_cord, :prefecture, :city, :address_number, :building_name, :phone_number, :icon_image, :profile)
  end

end
