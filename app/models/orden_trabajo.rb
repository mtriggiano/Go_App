class OrdenTrabajo < ApplicationRecord
  belongs_to :cliente, optional: true

  enum estado: {
    pendiente: 0,
    finalizado: 1,
    en_progreso: 2,
    cancelado: 3
  }

  def self.ransackable_associations(auth_object = nil)
    %w[cliente]
  end

  def self.ransackable_attributes(auth_object = nil)
    super - %w[id created_at updated_at]
  end
end
