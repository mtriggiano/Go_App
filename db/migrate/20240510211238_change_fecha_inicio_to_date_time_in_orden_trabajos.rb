# db/migrate/[timestamp]_change_fecha_inicio_to_date_time_in_orden_trabajos.rb

class ChangeFechaInicioToDateTimeInOrdenTrabajos < ActiveRecord::Migration[7.1]
  def change
    change_column :orden_trabajos, :fecha_inicio, :datetime
  end
end
