class AddDefaultEstadoToOrdenTrabajos < ActiveRecord::Migration[7.1]
  def change
    # Establecer un valor predeterminado para la columna 'estado'
    # Asegúrate de que el valor predeterminado corresponda al valor del enum 'pendiente' si es '0'
    change_column_default :orden_trabajos, :estado, from: nil, to: 0
  end
end
