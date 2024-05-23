module UserManagement
  class RolesController < ApplicationController
    before_action :authorize_access

    def index
      @roles = Role.all
    end

    def show
      @role = Role.find(params[:id])
    end

    def new
      @role = Role.new
    end

    def create
      @role = Role.new(role_params)
      if @role.save
        redirect_to user_management_roles_path, notice: 'Role creado exitosamente.'
      else
        render :new
      end
    end

    def edit
      @role = Role.find(params[:id])
    end

    def update
      @role = Role.find(params[:id])
      if @role.update(role_params)
        redirect_to user_management_roles_path, notice: 'Role actualizado exitosamente.'
      else
        render :edit
      end
    end

    def destroy
      @role = Role.find(params[:id])
      @role.destroy
      redirect_to user_management_roles_path, notice: 'Role eliminado exitosamente.'
    end

    private

    def role_params
      params.require(:role).permit(:name, permission_ids: [])
    end

    def authorize_access
      authorize! :manage, Role
    end
  end
end
