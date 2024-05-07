ActiveAdmin.register Cliente do
  permit_params :nombre, :apellido, :dni_cuit, :direccion, :email, :celular

  index do
    selectable_column
    id_column
    column :nombre
    column :apellido
    column :dni_cuit
    column :direccion
    column :email
    column :celular
    actions
  end

  form do |f|
    f.inputs do
      f.input :nombre
      f.input :apellido
      f.input :dni_cuit
      f.input :direccion
      f.input :email
      f.input :celular
    end
    f.actions
  end

  show do
    attributes_table do
      row :nombre
      row :apellido
      row :dni_cuit
      row :direccion
      row :email
      row :celular
    end
  end
end

