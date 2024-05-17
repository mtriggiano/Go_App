# app/controllers/user_management/role_assignments_controller.rb
module UserManagement
    class RoleAssignmentsController < ApplicationController
      before_action :set_admin_user_role_assignment, only: [:edit, :update, :destroy]
  
      def index
        @q = AdminUserRoleAssignment.ransack(params[:q])
        @admin_user_role_assignments = @q.result(distinct: true).page(params[:page]).per(10)
      end
  
      def new
        @admin_user_role_assignment = AdminUserRoleAssignment.new
      end
  
      def create
        admin_user = AdminUser.find(role_assignment_params[:admin_user_id])
        roles = Role.where(id: role_assignment_params[:role_ids].reject(&:blank?))
        admin_user.roles = roles
  
        if admin_user.save
          redirect_to user_management_role_assignments_path, notice: "Roles asignados correctamente."
        else
          render :new
        end
      end
  
      def edit
        @admin_user = @admin_user_role_assignment.admin_user
        @roles = Role.all
      end
  
      def update
        admin_user = AdminUser.find(role_assignment_params[:admin_user_id])
        roles = Role.where(id: role_assignment_params[:role_ids].reject(&:blank?))
        admin_user.roles = roles
  
        if admin_user.save
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
    end
  end
  