module UserManagement
  class AdminUsersController < ApplicationController
    before_action :authorize_access

    def index
      @q = AdminUser.ransack(params[:q])
      @admin_users = @q.result.page(params[:page])
    end

    def show
      @admin_user = AdminUser.find(params[:id])
    end

    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new(admin_user_params)
      if @admin_user.save
        redirect_to user_management_admin_users_path, notice: "Admin User creado exitosamente."
      else
        render :new
      end
    end

    def edit
      @admin_user = AdminUser.find(params[:id])
    end

    def update
      @admin_user = AdminUser.find(params[:id])
      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      if @admin_user.update(admin_user_params)
        redirect_to user_management_admin_users_path, notice: "Admin User actualizado exitosamente."
      else
        render :edit
      end
    end

    def destroy
      @admin_user = AdminUser.find(params[:id])
      @admin_user.destroy
      redirect_to user_management_admin_users_path, notice: "Admin User eliminado exitosamente."
    end

    private

    def admin_user_params
      params.require(:admin_user).permit(:email, :password, :password_confirmation, :nombre, :apellido)
    end

    def authorize_access
      authorize! :manage, AdminUser
    end
  end
end
