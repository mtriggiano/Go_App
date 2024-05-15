class CreateRolePermission < ActiveRecord::Migration[7.1]
  def change
    create_table :role_permission do |t|
      t.references :role, null: false, foreign_key: true
      t.references :permission, null: false, foreign_key: true

      t.timestamps
    end
  end
end
