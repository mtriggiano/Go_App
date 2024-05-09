ActiveAdmin.register OrdenTrabajo do
  permit_params :numero_remito, :fecha_inicio, :destino, :celular, :estado, :cliente_id

  filter :numero_remito
  filter :fecha_inicio
  filter :cliente_id, as: :select, collection: -> { Cliente.all.map { |c| [c.dni_cuit, c.id] } }
  filter :estado, as: :select, collection: OrdenTrabajo.estados.keys.map { |estado| [estado.humanize, estado] }

  index do
    selectable_column
    id_column
    column :numero_remito
    column :fecha_inicio
    column :cliente do |orden|
      orden.cliente ? link_to(orden.cliente.dni_cuit, admin_cliente_path(orden.cliente)) : 'Cliente no asignado'
    end
    column :destino
    column :celular
    column :estado
    actions
  end

  form do |f|
    f.inputs 'Detalles de la Orden de Trabajo' do
      f.input :numero_remito
      f.input :fecha_inicio, as: :datepicker
      f.input :cliente, as: :select, collection: Cliente.all.map { |c| ["#{c.nombre} #{c.apellido} - #{c.dni_cuit}", c.id] }, include_blank: 'Seleccione un Cliente', input_html: { class: 'select2' }
      f.input :destino
      f.input :celular
      f.input :estado, as: :select, collection: OrdenTrabajo.estados.keys.map { |key| [key.humanize, key] }, include_blank: 'Seleccione Estado'
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.includes(:cliente) # optimiza la carga incluyendo la asociación cliente
    end
  end
end
