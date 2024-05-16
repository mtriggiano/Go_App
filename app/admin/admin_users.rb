# app/admin/admin_users.rb
ActiveAdmin.register AdminUser do
  menu priority: 2

  permit_params :email, :password, :password_confirmation, role_ids: []

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.inputs 'Roles' do
      f.input :roles, as: :check_boxes, collection: Role.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :roles do |admin_user|
        admin_user.roles.collect { |role| role.name }.join(', ')
      end
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
    end
  end
end
