class RenameTipoOrdenToTipoOrdensInOrdenTrabajos < ActiveRecord::Migration[7.0]
  def change
    rename_column :orden_trabajos, :tipo_orden, :tipo_ordens
  end
end
