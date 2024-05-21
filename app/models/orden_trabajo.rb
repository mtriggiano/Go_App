# app/models/orden_trabajo.rb
class OrdenTrabajo < ApplicationRecord
  belongs_to :cliente, optional: true

  # Especifica el tipo de dato de los enums si ActiveRecord no lo detecta automáticamente
  attribute :tipo_ordens, :integer
  attribute :estado, :integer

  enum estado: {
    pendiente: 0,
    finalizado: 1,
    en_proceso: 2,
    reprogramar: 3,
    cancelada: 4,
    anulada: 5
  }

  enum tipo_ordens: {
    servicio_internet: 0,
    instalaciones: 1,
    mantenimiento: 2,
    garantia: 3
  }

  # Métodos ransackable
  def self.ransackable_associations(auth_object = nil)
    %w[cliente]
  end

  def self.ransackable_attributes(auth_object = nil)
    super - %w[id created_at updated_at]
  end
end
