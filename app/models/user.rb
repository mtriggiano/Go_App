# app/models/user.rb
class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Callback to assign a default role after user creation
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end

  # Métodos ransackable
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at]
  end
end
