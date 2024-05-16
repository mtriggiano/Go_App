# app/admin/roles.rb
ActiveAdmin.register Role, namespace: :user_management do
  menu priority: 3, label: "Roles"

  permit_params :name, permission_ids: []

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs 'Role Details' do
      f.input :name
      f.input :permissions, as: :check_boxes, collection: Permission.all
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :permissions do |role|
        role.permissions.collect { |permission| permission.name }.join(', ')
      end
    end
  end

  # Agregar un menú personalizado para volver atrás
  sidebar :back_to_admin do
    link_to "Volver Atrás", admin_root_path, class: "button"
  end
end
