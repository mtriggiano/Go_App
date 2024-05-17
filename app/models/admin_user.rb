class AdminUser < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles, join_table: :admin_users_roles

  def self.ransackable_attributes(auth_object = nil)
    ["apellido", "created_at", "email", "id", "nombre", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["roles"]
  end

  def self.serialize_from_session(key, salt)
    record = to_adapter.get(key[0])
    record if record && record.authenticatable_salt == salt
  end

  def self.find_for_authentication(tainted_conditions)
    find_by(tainted_conditions)
  end
end
