class AddNombreAndApellidoToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :nombre, :string
    add_column :admin_users, :apellido, :string
  end
end
