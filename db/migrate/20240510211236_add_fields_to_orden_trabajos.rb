class AddFieldsToOrdenTrabajos < ActiveRecord::Migration[7.1]
  def change
    add_column :orden_trabajos, :tipo_orde, :string
    add_column :orden_trabajos, :detalle_tareas, :text
    add_column :orden_trabajos, :numero_presupuesto, :string
  end
end
