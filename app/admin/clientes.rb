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

  # Añade el controlador personalizado con la acción de búsqueda
  controller do
    # Acción de búsqueda para ser usada con AJAX
    def search
      clients = Cliente.ransack(nombre_or_apellido_or_dni_cuit_cont: params[:q]).result(distinct: true)
      render json: clients.map { |client| { id: client.id, text: "#{client.nombre} #{client.apellido} - #{client.dni_cuit}" } }
    end
  end
end
