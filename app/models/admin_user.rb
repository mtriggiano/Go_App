class AdminUser < ApplicationRecord
  has_and_belongs_to_many :roles
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  # Define the attributes that can be searched by Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[id email nombre apellido created_at updated_at]
  end

  # Otras asociaciones y validaciones...
end
