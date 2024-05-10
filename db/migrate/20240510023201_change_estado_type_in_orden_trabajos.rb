class ChangeEstadoTypeInOrdenTrabajos < ActiveRecord::Migration[7.0]
  def up
    # Elimina el valor predeterminado actual
    change_column_default :orden_trabajos, :estado, from: '0', to: nil

    # Cambia el tipo de columna
    change_column :orden_trabajos, :estado, 'integer USING CAST(estado AS integer)'

    # Establece un nuevo valor predeterminado adecuado para el tipo integer
    change_column_default :orden_trabajos, :estado, from: nil, to: 0
  end

  def down
    change_column_default :orden_trabajos, :estado, from: 0, to: nil
    change_column :orden_trabajos, :estado, :string
    change_column_default :orden_trabajos, :estado, from: nil, to: '0'
  end
end
