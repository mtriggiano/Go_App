class CreateOrdenTrabajos < ActiveRecord::Migration[7.1]
  def change
    create_table :orden_trabajos do |t|
      t.string :numero_orden
      t.string :numero_remito
      t.date :fecha_inicio
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :destino
      t.string :celular
      t.string :estado

      t.timestamps
    end
  end
end
