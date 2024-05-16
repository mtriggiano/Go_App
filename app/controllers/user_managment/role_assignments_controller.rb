# app/controllers/user_management/role_assignments_controller.rb
module UserManagement
    class RoleAssignmentsController < ApplicationController
      def create
        @admin_user_role_assignment = AdminUserRoleAssignment.new(role_assignment_params)
  
        if @admin_user_role_assignment.valid?
          admin_user = AdminUser.find(@admin_user_role_assignment.admin_user_id)
          role = Role.find(@admin_user_role_assignment.role_id)
          admin_user.roles << role unless admin_user.roles.include?(role)
          redirect_to user_management_role_assignments_path, notice: "Rol asignado correctamente."
        else
          render 'admin/admin_user_role_assignments/form'
        end
      end
  
      private
  
      def role_assignment_params
        params.require(:admin_user_role_assignment).permit(:admin_user_id, :role_id)
      end
    end
  end
  