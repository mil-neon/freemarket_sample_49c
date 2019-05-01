module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def user_signed_in?
    session[:user_id]
  end
end
