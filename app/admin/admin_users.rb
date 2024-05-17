# app/admin/admin_users.rb
ActiveAdmin.register AdminUser, namespace: :user_management do
  menu priority: 1, label: "Admin Users"

  permit_params :email, :password, :password_confirmation, :nombre, :apellido

  index do
    selectable_column
    id_column
    column :email
    column :nombre
    column :apellido
    column :roles do |admin_user|
      admin_user.roles.pluck(:name).join(', ')
    end
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :nombre
  filter :apellido
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :nombre
      f.input :apellido
      f.input :password, input_html: { autocomplete: "new-password" }
      f.input :password_confirmation, input_html: { autocomplete: "new-password" }
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :nombre
      row :apellido
      row :roles do |admin_user|
        admin_user.roles.collect { |role| role.name }.join(', ')
      end
      row :current_sign_in_at
      row :sign_in_count
      row :created_at
    end
  end

  controller do
    def create
      super
    end

    def update
      if params[:admin_user][:password].blank? && params[:admin_user][:password_confirmation].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end
  end
end
