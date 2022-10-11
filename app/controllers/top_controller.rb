class TopController < ApplicationController
  def main
    if session[:login_uid]
      render 'main'
    else
      render 'login'
    end
  end
  
  def login
    user = User.find_by(uid: params[:uid])
    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:login_uid] = params[:uid]
      redirect_to root_path
    else
      render 'error'
    end
  end
  
  def logout
    reset_session
    redirect_to root_path
  end
end