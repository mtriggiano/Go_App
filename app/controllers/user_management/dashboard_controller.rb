# app/controllers/user_management/dashboard_controller.rb
module UserManagement
    class DashboardController < ApplicationController
      def show
        @user = current_user
      end
  
      def update
        @user = current_user
        if @user.update(user_params)
          redirect_to user_management_dashboard_path, notice: 'User information was successfully updated.'
        else
          render :show
        end
      end
  
      private
  
      def user_params
        params.require(:user).permit(:name, :surname, :password, :password_confirmation)
      end
    end
  end
  