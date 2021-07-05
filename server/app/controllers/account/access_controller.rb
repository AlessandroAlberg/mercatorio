class Account::AccessController < ApplicationController

  before_action :user_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    @found_user = user.find(session[:user_id])
    @user = @found_user.first_name
    @user_id = @found_user.user_id

    if session[:pending_rent]
      @cart_count = session[:pending_rent].count
    end
  end

  def login
  end
  
  def attempt_login
  	if params[:username].present? && params[:password].present?
      found_user = user.where(username: params[:username]).first
      if found_user
        user = found_user.authenticate(params[:password])
      end
    end

    if user
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in."
      redirect_to(account_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
  	session[:user_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(account_access_login_path)
  end  

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

end