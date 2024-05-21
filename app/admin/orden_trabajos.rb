ActiveAdmin.register OrdenTrabajo do
  menu priority: 4

  permit_params :numero_remito, :fecha_inicio, :destino, :contacto, :celular, :estado, :cliente_id, :numero_presupuesto, :detalle_tareas, :tipo_ordens

  index do
    selectable_column
    id_column
    column :numero_remito
    column :numero_presupuesto
    column :fecha_inicio
    column :tipo_ordens do |orden|
      orden.tipo_ordens ? orden.tipo_ordens.humanize : 'Tipo no definido'
    end
    column "Nombre", sortable: 'clientes.nombre' do |orden|
      orden.cliente ? orden.cliente.nombre : 'Nombre no asignado'
    end
    column "Apellido", sortable: 'clientes.apellido' do |orden|
      orden.cliente ? orden.cliente.apellido : 'Apellido no asignado'
    end
    column "DNI/CUIT", sortable: 'clientes.dni_cuit' do |orden|
      orden.cliente ? link_to(orden.cliente.dni_cuit, admin_cliente_path(orden.cliente)) : 'Cliente no asignado'
    end
    column :destino
    column :contacto
    column :celular
    column :estado do |orden|
      orden.estado ? orden.estado.humanize : 'Estado no definido'
    end
    actions
  end

  form do |f|
    f.inputs 'Detalles de la Orden de Trabajo' do
      f.input :tipo_ordens, as: :select, collection: OrdenTrabajo.tipo_ordens.keys.map { |key| [key.humanize, key] }, include_blank: 'Seleccione Tipo de Orden'
      f.input :numero_remito
      f.input :numero_presupuesto
      f.input :fecha_inicio, as: :datetime_picker
      f.input :cliente, as: :select, collection: Cliente.all.map { |c| ["#{c.nombre} #{c.apellido} - #{c.dni_cuit}", c.id] }, include_blank: 'Seleccione un Cliente', input_html: { class: 'select2' }
      f.input :destino
      f.input :contacto
      f.input :celular
      f.input :detalle_tareas, as: :text, input_html: { class: 'tinymce' }
      f.input :estado, as: :select, collection: OrdenTrabajo.estados.keys.map { |key| [key.humanize, key] }, include_blank: 'Seleccione Estado'
    end
    f.actions
  end

  show do
    attributes_table do
      row :tipo_ordens
      row :numero_remito
      row :numero_presupuesto
      row :fecha_inicio
      row :nombre do |orden|
        orden.cliente ? orden.cliente.nombre : 'Nombre no asignado'
      end
      row :apellido do |orden|
        orden.cliente ? orden.cliente.apellido : 'Apellido no asignado'
      end
      row :dni_cuit do |orden|
        orden.cliente ? link_to(orden.cliente.dni_cuit, admin_cliente_path(orden.cliente)) : 'Cliente no asignado'
      end
      row :destino
      row :contacto
      row :celular
      row :detalle_tareas do |orden|
        sanitize orden.detalle_tareas, tags: %w[p strong img], attributes: %w[src style]
      end
      row :estado do |orden|
        orden.estado ? orden.estado.humanize : 'Estado no definido'
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  controller do
    def scoped_collection
      super.includes(:cliente) # optimiza la carga incluyendo la asociación cliente
    end

    private

    def authorize_access
      authorize! :manage, OrdenTrabajo
    end
  end
end
