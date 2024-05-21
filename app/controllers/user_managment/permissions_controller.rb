module UserManagement
  class PermissionsController < ApplicationController
    before_action :authorize_access

    def index
      @permissions = Permission.all
    end

    def show
      @permission = Permission.find(params[:id])
    end

    def new
      @permission = Permission.new
    end

    def create
      @permission = Permission.new(permission_params)
      if @permission.save
        redirect_to user_management_permissions_path, notice: 'Permission creado exitosamente.'
      else
        render :new
      end
    end

    def edit
      @permission = Permission.find(params[:id])
    end

    def update
      @permission = Permission.find(params[:id])
      if @permission.update(permission_params)
        redirect_to user_management_permissions_path, notice: 'Permission actualizado exitosamente.'
      else
        render :edit
      end
    end

    def destroy
      @permission = Permission.find(params[:id])
      @permission.destroy
      redirect_to user_management_permissions_path, notice: 'Permission eliminado exitosamente.'
    end

    private

    def permission_params
      params.require(:permission).permit(:name, :description, :action, :subject_class)
    end

    def authorize_access
      authorize! :manage, Permission
    end
  end
end
