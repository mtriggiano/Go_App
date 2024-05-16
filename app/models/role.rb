# app/models/role.rb
class Role < ApplicationRecord
  # Define qué atributos pueden ser buscados a través de Ransack
  has_many :role_permissions
  has_many :permissions, through: :role_permissions

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at updated_at]
  end

  has_and_belongs_to_many :users, join_table: :users_roles
  has_and_belongs_to_many :admin_users, join_table: :admin_users_roles
  
  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  validates :name, presence: true, uniqueness: true
  
  scopify
end
