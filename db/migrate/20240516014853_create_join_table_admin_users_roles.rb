# db/migrate/[timestamp]_create_join_table_admin_users_roles.rb
class CreateJoinTableAdminUsersRoles < ActiveRecord::Migration[7.0]
  def change
    create_join_table :admin_users, :roles do |t|
      t.index :admin_user_id
      t.index :role_id
    end
  end
end
