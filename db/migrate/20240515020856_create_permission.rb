class Permission < ActiveRecord::Migration[7.1]
  def change
    create_table :permission do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
