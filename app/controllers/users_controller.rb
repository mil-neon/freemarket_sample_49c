class UsersController < ApplicationController
  before_action :set_user
  def new
  end

  def login
  end

  def mypage
  def set_user
    @user = User.find(session[:user_id]) if session[:user_id] != nil
  end

  private

  def update_params
    params.permit(:nickname, :firstname_fullangle, :lastname_fullangle, :firstname_kana, :lastname_kana, :birthday, :postal_cord, :prefecture, :city, :address_number, :building_name, :phone_number, :icon_image, :profile)
  end
end
