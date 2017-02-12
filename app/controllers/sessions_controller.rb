class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to users_path
    else
      flash[:notice] = "Email and password mismatch, please try again or create a new account!"
        redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

end
