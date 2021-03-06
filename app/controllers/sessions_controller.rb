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
    session[:password] = params[:password]
    session[:password_confirmation] = params[:password_confirmation]
    session[:firstname_fullangle] = params[:firstname_fullangle]
    session[:lastname_fullangle] = params[:lastname_fullangle]
    session[:firstname_kana] = params[:firstname_kana]
    session[:lastname_kana] = params[:lastname_kana]
    session[:birthday] = @birthday
    flash[:recaptcha] = '※押してください' if params["g-recaptcha-response"] == ""
    flash[:nickname] = '※入力してください' if params[:nickname] == ""
    flash[:nickname2] = 'すでに存在するユーザーです' if User.find_by(nickname: params[:nickname])
    flash[:email] = '※入力してください' if params[:email] == ""
    flash[:mail2] = 'すでに存在するメールアドレスです' if User.find_by(email: params[:email])
    flash[:password] = '※入力してください' if params[:password] == ""
    flash[:password_confirm] = '※入力してください' if params[:password_confirmation] == ""
    flash[:password_match] = '※パスワードが一致しません' if params[:password] != params[:password_confirmation]
    flash[:password_length] = '※6文字以上で入力してください' if params[:password].length <= 5
    flash[:firstname_fullangle] = '※入力してください' if params[:firstname_fullangle] == ""
    flash[:lastname_fullangle] = '※入力してください' if params[:lastname_fullangle] == ""
    flash[:firstname_kana] = '※入力してください' if params[:firstname_kana] == ""
    flash[:lastname_kana] = '※入力してください' if params[:lastname_kana] == ""
    flash[:kana_first] = '※カタカナで記入してください' if params[:firstname_kana].match(/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/) == nil
    flash[:kana_last] = '※カタカナで記入してください' if params[:lastname_kana].match(/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/) == nil
    if params["g-recaptcha-response"] != "" && params[:nickname] != "" && params[:email] != "" && params[:password] != "" && params[:password_confirmation] != "" && params[:firstname_fullangle] != "" && params[:lastname_fullangle] != "" && params[:firstname_kana] != "" && params[:lastname_kana] != "" && User.find_by(nickname: params[:nickname]) == nil && User.find_by(email: params[:email]) == nil && params[:password] == params[:password_confirmation] && params[:password].length >= 5
      session[:password] = Rails.application.message_verifier('secret_key').generate(token: params[:password])
      redirect_to new_signup_phone_path
    elsif params["g-recaptcha-response"] != "" && params[:nickname] != "" && params[:email] != "" && params[:password] != "" && params[:password_confirmation] != "" && params[:firstname_fullangle] != "" && params[:lastname_fullangle] != "" && params[:firstname_kana] != "" && params[:lastname_kana] != "" && User.find_by(nickname: params[:nickname]) == nil && User.find_by(email: params[:email]) == nil && session[:uid]
      redirect_to new_signup_phone_path
    else
      redirect_to action: :new, controller: 'sessions'
    end
  end

  def create_address
    session[:postal_cord] = params[:postal_cord]
    session[:city] = params[:city]
    session[:address_number] = params[:address_number]
    flash[:firstname_fullangle] = '※入力してください' if params[:firstname_fullangle] == ""
    flash[:lastname_fullangle] = '※入力してください' if params[:lastname_fullangle] == ""
    flash[:firstname_kana] = '※入力してください' if params[:firstname_kana] == ""
    flash[:lastname_kana] = '※入力してください' if params[:lastname_kana] == ""
    flash[:kana_first] = '※カタカナで記入してください' if params[:firstname_kana].match(/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/) == nil
    flash[:kana_last] = '※カタカナで記入してください' if params[:lastname_kana].match(/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/) == nil
    flash[:postal_cord] = '※入力してください' if params[:postal_cord] == ""
    flash[:city] = '※入力してください' if params[:city] == ""
    flash[:address_number] = '※入力してください' if params[:address_number] == ""
    if session[:uid]
      @user = User.new(nickname: session[:nickname], email: session[:email], firstname_fullangle: session[:firstname_fullangle], lastname_fullangle: session[:lastname_fullangle], firstname_kana: session[:firstname_kana], lastname_kana: session[:lastname_kana], birthday: session[:birthday], postal_cord: params[:postal_cord], prefecture_id: params[:prefecture_id], city: params[:city], address_number: params[:address_number], building_name: params[:building_name], phone_number: params[:phone_number], uid: session[:uid], provider: session[:provider])
      if @user.save
        session[:user_id] = @user.id
        redirect_to new_signup_pay_path
      else
        redirect_to new_signup_address_path
      end
    else
      @user = User.new(nickname: session[:nickname], email: session[:email], firstname_fullangle: session[:firstname_fullangle], lastname_fullangle: session[:lastname_fullangle], firstname_kana: session[:firstname_kana], lastname_kana: session[:lastname_kana], birthday: session[:birthday], postal_cord: params[:postal_cord], prefecture_id: params[:prefecture_id], city: params[:city], address_number: params[:address_number], building_name: params[:building_name], phone_number: params[:phone_number], password: session[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect_to new_signup_pay_path
      else
        redirect_to new_signup_address_path
      end
    end
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

  def sns
    auth = request.env['omniauth.auth']
    user = User.find_by(uid: auth[:uid])
    if user.present? && auth.present?
      session[:user_id] = user.id
      redirect_to root_path
    elsif auth.present?
      session[:provider] = auth[:provider]
      session[:uid] = auth[:uid]
      redirect_to new_registration_path
    else
      redirect_to new_login_path, notice: 'Facebook認証に失敗しました。'
    end
  end
end
