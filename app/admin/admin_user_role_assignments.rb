# app/admin/admin_user_role_assignments.rb
ActiveAdmin.register AdminUser, as: "Role Assignment", namespace: :user_management do
  menu priority: 5, label: "Role Assignments"

  permit_params :email, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :roles do |admin_user|
      admin_user.roles.pluck(:name).join(', ')
    end
    actions
  end

  filter :email
  filter :roles_name, as: :select, collection: Role.all.map { |r| [r.name, r.id] }
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs 'Asignar Roles a Admin User' do
      f.input :roles, as: :check_boxes, collection: Role.all.map { |r| [r.name, r.id] }, selected: f.object.roles.pluck(:id)
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :roles do |admin_user|
        admin_user.roles.pluck(:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
  end

  controller do
    def create
      admin_user = AdminUser.new(role_assignment_params)
      roles = Role.where(id: role_assignment_params[:role_ids].reject(&:blank?))
      admin_user.roles = roles

      if admin_user.save
        redirect_to user_management_role_assignments_path, notice: "Roles asignados correctamente."
      else
        render :new
      end
    end

    def update
      admin_user = AdminUser.find(params[:id])
      roles = Role.where(id: role_assignment_params[:role_ids].reject(&:blank?))
      admin_user.roles = roles

      if admin_user.save
        redirect_to user_management_role_assignments_path, notice: "Roles actualizados correctamente."
      else
        render :edit
      end
    end

    private

    def role_assignment_params
      params.require(:admin_user).permit(:email, role_ids: [])
    end
  end
end
