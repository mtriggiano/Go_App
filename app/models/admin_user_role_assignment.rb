# app/models/admin_user_role_assignment.rb
class AdminUserRoleAssignment < ApplicationRecord
  belongs_to :admin_user
  belongs_to :role

  def self.ransackable_associations(auth_object = nil)
    %w[admin_user role]
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[admin_user_id created_at id role_id updated_at]
  end
end
