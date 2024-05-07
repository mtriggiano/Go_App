ActiveAdmin.register OrdenTrabajo do
    permit_params :numero_orden, :numero_remito, :fecha_inicio, :nombre, :apellido, :dni, :destino, :celular, :estado
  
    index do
      selectable_column
      id_column
      column :numero_orden
      column :numero_remito
      column :fecha_inicio
      column :nombre
      column :apellido
      column :dni
      column :destino
      column :celular
      column :estado
      actions
    end
  
    form do |f|
      f.inputs 'Details' do
        f.input :numero_orden
        f.input :numero_remito
        f.input :fecha_inicio, as: :datepicker
        f.input :nombre
        f.input :apellido
        f.input :dni
        f.input :destino
        f.input :celular
        f.input :estado, as: :select, collection: ["Pendiente", "Finalizado"]
      end
      f.actions
    end
  end
  