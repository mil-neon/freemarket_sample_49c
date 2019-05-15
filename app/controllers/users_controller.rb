class UsersController < ApplicationController
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
  end

end
