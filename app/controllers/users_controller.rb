class UsersController < ApplicationController
    before_action :current_user_redirect, only: [:show, :index, :destroy, :edit, :update]
    before_action :redirect_if_restricted, only: [:show, :destroy, :edit, :update]

    def new
      @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to users_path
        else
          @errors = @user.errors.full_messages
          render 'new'
        end
    end

    def index
      @users = User.all
    end

    def show
      get_user
    end

    def edit
      get_user
      redirect_not_admin_or_self
    end

    def update
      get_user

      redirect_not_admin_or_self
      if is_an_admin
        @user.update(user_role_param)
      end
      if @user.update(user_params)
        redirect_to users_path
      else
        @errors = @user.errors.full_messages
        render 'edit'
      end
    end

    def destroy
      if is_an_admin
        get_user
        unless @user.destroy
          flash[:notice] = "Something went wrong. Plase try again"
        end
      else
        flash[:notice] = "You do not have authorization to perform this action"
      end
        redirect_to users_path
    end

    private

    def get_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :phone_number)
    end

    def user_role_param
      params.require(:user).permit(:role)
    end
end
