class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def current_user_redirect
    redirect_to root_path unless current_user
  end

  def is_an_admin
    current_user.role == 'admin'
  end

  def is_a_user
    current_user.role == 'user'
  end

  def is_restricted
    current_user.role == 'restricted'
  end

  def redirect_not_admin_or_self
    unless is_an_admin || is_self
      flash[:notice] = "You do not have authorization to perform this action"
      redirect_to users_path
    end
  end

  def redirect_if_restricted
    if is_restricted
      redirect_to users_path
      flash[:notice] = "You do not have authorization to perform this action"
    end
  end

  def is_self
    @current_user.id == @user.id
  end
end
