class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :roles, join_table: :admin_users_roles
  
  # Definir los atributos que pueden ser buscados por Ransack.
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at]
  end
end
