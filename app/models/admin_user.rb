class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  # Definir los atributos que pueden ser buscados por Ransack.
  # Asegúrate de no incluir datos sensibles.
  def self.ransackable_attributes(auth_object = nil)
    # Lista de atributos que Ransack puede buscar.
    # Ajusta esta lista según las necesidades de tu aplicación.
    %w[id email created_at updated_at]
  end
end
