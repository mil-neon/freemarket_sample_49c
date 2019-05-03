class SessionsController < ApplicationController
  def new; end

  def signup_phone; end

  def signup_address; end

  def signup_pay; end

  def complete; end

  def create_user
    @date = params["birthday(1i)"] + "-" + params["birthday(2i)"] + "-" + params["birthday(3i)"]
    @birthday = @date.to_date
    session[:nickname] = params[:nickname]
    session[:email] = params[:email]
    session[:password] = Rails.application.message_verifier('secret_key').generate(token: params[:password])
    session[:password_confirmation] = params[:password_confirmation]
    session[:firstname_fullangle] = params[:firstname_fullangle]
    session[:lastname_fullangle] = params[:lastname_fullangle]
    session[:firstname_kana] = params[:firstname_kana]
    session[:lastname_kana] = params[:lastname_kana]
    session[:birthday] = @birthday
    redirect_to new_signup_phone_path
  end

  def create_address
    @user = User.new(nickname: session[:nickname], email: session[:email], firstname_fullangle: session[:firstname_fullangle], lastname_fullangle: session[:lastname_fullangle], firstname_kana: session[:firstname_kana], lastname_kana: session[:lastname_kana], birthday: session[:birthday], postal_cord: params[:postal_cord], prefecture_id: params[:prefecture_id], city: params[:city], address_number: params[:address_number], building_name: params[:building_name], phone_number: params[:phone_number], password: session[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_signup_pay_path
    else
      redirect_to new_user_path
    end
  end

  def create
  end

  def login
    login_user = User.find_by(email: params[:email], password: Rails.application.message_verifier('secret_key').generate({ token: params[:password] }))
      session[:user_id] = login_user.id if login_user
      redirect_to root_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
