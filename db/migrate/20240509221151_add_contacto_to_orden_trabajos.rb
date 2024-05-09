class AddContactoToOrdenTrabajos < ActiveRecord::Migration[7.1]
  def change
    add_column :orden_trabajos, :contacto, :string
  end
end
