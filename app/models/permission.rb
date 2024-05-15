class Permission < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        %w[name description created_at updated_at]
      end
    has_many :role_permissions
    has_many :roles, through: :role_permissions
  end
  