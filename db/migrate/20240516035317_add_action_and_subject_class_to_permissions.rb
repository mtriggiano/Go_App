class AddActionAndSubjectClassToPermissions < ActiveRecord::Migration[7.1]
  def change
    add_column :permissions, :action, :string
    add_column :permissions, :subject_class, :string
  end
end
