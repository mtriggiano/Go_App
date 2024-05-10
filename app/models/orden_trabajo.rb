class OrdenTrabajo < ApplicationRecord
  belongs_to :cliente, optional: true

  # Define un enum para el campo estado
  enum estado: {
    pendiente: 0,
    finalizado: 1,
    en_proceso: 2,
    reprogramar: 3,
    cancelada: 4,
    anulada: 5
    # Agrega más estados según sea necesario
  }

  # Métodos ransackable
  def self.ransackable_associations(auth_object = nil)
    %w[cliente]
  end

  def self.ransackable_attributes(auth_object = nil)
    super - %w[id created_at updated_at]
  end
end
