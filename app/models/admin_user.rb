# app/models/admin_user.rb
class AdminUser < ApplicationRecord
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles, join_table: :admin_users_roles

  validates :nombre, presence: true
  validates :apellido, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[id email nombre apellido created_at updated_at]
  end
end
