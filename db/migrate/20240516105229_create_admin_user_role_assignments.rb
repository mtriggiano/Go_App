class CreateAdminUserRoleAssignments < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_user_role_assignments do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
