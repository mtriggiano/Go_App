ActiveAdmin.register Role do
  menu priority: 5  # Ajusta la prioridad para posicionarlo en el menú
  permit_params :name, permission_ids: [] # Asegúrate de permitir los parámetros adecuados

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
    end
  end
end
