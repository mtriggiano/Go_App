# app/admin/admin_user_role_assignments.rb
ActiveAdmin.register AdminUserRoleAssignment, as: "Role Assignment", namespace: :user_management do
  menu priority: 5, label: "Role Assignments"

  permit_params :admin_user_id, :role_id

  index do
    selectable_column
    id_column
    column :admin_user do |assignment|
      assignment.admin_user.email
    end
    column :role do |assignment|
      assignment.role.name
    end
    actions
  end

  filter :admin_user, as: :select, collection: AdminUser.all.map { |u| [u.email, u.id] }
  filter :role, as: :select, collection: Role.all.map { |r| [r.name, r.id] }
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs 'Asignar Rol a Admin User' do
      f.input :admin_user, as: :select, collection: AdminUser.all.map { |u| [u.email, u.id] }
      f.input :role, as: :select, collection: Role.all.map { |r| [r.name, r.id] }
    end
    f.actions
  end

  controller do
    def create
      @admin_user_role_assignment = AdminUserRoleAssignment.new(permitted_params[:admin_user_role_assignment])

      if @admin_user_role_assignment.valid?
        admin_user = AdminUser.find(@admin_user_role_assignment.admin_user_id)
        role = Role.find(@admin_user_role_assignment.role_id)
        admin_user.roles << role unless admin_user.roles.include?(role)
        redirect_to user_management_role_assignments_path, notice: "Rol asignado exitosamente."
      else
        render :new
      end
    end
  end
end
