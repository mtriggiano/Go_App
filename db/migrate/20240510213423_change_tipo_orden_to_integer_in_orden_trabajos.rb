# db/migrate/20240510213423_change_tipo_orden_to_integer_in_orden_trabajos.rb

class ChangeTipoOrdenToIntegerInOrdenTrabajos < ActiveRecord::Migration[7.1]
  def up
    # Cambia el tipo de columna 'tipo_orden' a integer utilizando 'USING'
    change_column :orden_trabajos, :tipo_ordens, 'integer USING CAST(tipo_orden AS integer)'
  end

  def down
    # Cambia de nuevo a character varying en caso de que necesites revertir la migración
    change_column :orden_trabajos, :tipo_ordens, :string
  end
end
