class AddClienteIdToOrdenTrabajos < ActiveRecord::Migration[7.1]
  def change
    add_column :orden_trabajos, :cliente_id, :integer
  end
end
