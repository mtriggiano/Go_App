ActiveAdmin.register Permission, as: "Permission", namespace: :user_management do
  menu priority: 4, label: "Permisos"
  
  permit_params :name, :description, :action, :subject_class

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :action
    column :subject_class
    actions
  end

  filter :name
  filter :description
  filter :action
  filter :subject_class
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs "Detalles del Permiso" do
      f.input :name
      f.input :description
      f.input :action
      f.input :subject_class
    end
    f.actions
  end
end
