# app/models/permission.rb
class Permission < ApplicationRecord
  has_many :role_permissions
  has_many :roles, through: :role_permissions

  def self.ransackable_attributes(auth_object = nil)
    %w[id name description action subject_class created_at updated_at]
  end
end
