module UserManagement
  class UsersController < ApplicationController
    before_action :authorize_access

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private

    def authorize_access
      authorize! :manage, User
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, role_ids: [])
    end
  end
end
