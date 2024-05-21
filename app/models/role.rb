# app/models/role.rb
class Role < ApplicationRecord
  has_and_belongs_to_many :admin_users, join_table: :admin_users_roles
  has_and_belongs_to_many :users, join_table: :users_roles
  has_many :role_permissions, dependent: :destroy
  has_many :permissions, through: :role_permissions

  belongs_to :resource, polymorphic: true, optional: true

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true
  validates :name, presence: true, uniqueness: true

  scopify

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    ["admin_users", "permissions", "resource", "role_permissions", "users"]
  end
end
