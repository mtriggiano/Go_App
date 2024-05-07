class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni_cuit
      t.string :direccion
      t.string :email
      t.string :celular

      t.timestamps
    end
  end
end
