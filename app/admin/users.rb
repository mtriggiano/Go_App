ActiveAdmin.register User, namespace: :user_management do
  menu priority: 2, label: "Users"

  permit_params :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :roles do |user|
      user.roles.collect { |role| role.name }.join(', ')
    end
    actions
  end

  filter :email

  form do |f|
    f.inputs 'User Details' do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs 'Roles' do
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    f.actions
  end

  show do |user|
    attributes_table do
      row :email
      row :roles do
        user.roles.collect { |role| role.name }.join(', ')
      end
    end
  end

  controller do
    private

    def authorize_access
      authorize! :manage, User
    end
  end
end
