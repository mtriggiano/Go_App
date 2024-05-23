module UserManagement
  class RoleAssignmentsController < ApplicationController
    before_action :authorize_access
    before_action :set_admin_user_role_assignment, only: [:edit, :update, :destroy]

    def index
      @q = AdminUserRoleAssignment.ransack(params[:q])
      @admin_user_role_assignments = @q.result(distinct: true).includes(:admin_user, :role).page(params[:page]).per(10)
    end

    def new
      @admin_user_role_assignment = AdminUserRoleAssignment.new
    end

    def create
      @admin_user_role_assignment = AdminUserRoleAssignment.new(role_assignment_params)
      admin_user = AdminUser.find(@admin_user_role_assignment.admin_user_id)
      roles = Role.where(id: role_assignment_params[:role_ids].reject(&:blank?))
      admin_user.roles = roles

      if @admin_user_role_assignment.save
        redirect_to user_management_role_assignments_path, notice: "Roles asignados correctamente."
      else
        render :new
      end
    end

    def edit
    end

    def update
      admin_user = AdminUser.find(@admin_user_role_assignment.admin_user_id)
      roles = Role.where(id: role_assignment_params[:role_ids].reject(&:blank?))
      admin_user.roles = roles

      if @admin_user_role_assignment.update(role_assignment_params)
        redirect_to user_management_role_assignments_path, notice: "Roles actualizados correctamente."
      else
        render :edit
      end
    end

    def destroy
      @admin_user_role_assignment.destroy
      redirect_to user_management_role_assignments_path, notice: "Rol eliminado correctamente."
    end

    private

    def set_admin_user_role_assignment
      @admin_user_role_assignment = AdminUserRoleAssignment.find(params[:id])
    end

    def role_assignment_params
      params.require(:admin_user_role_assignment).permit(:admin_user_id, role_ids: [])
    end

    def authorize_access
      authorize! :manage, AdminUserRoleAssignment
    end
  end
end
