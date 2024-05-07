class OrdenTrabajo < ApplicationRecord
    # ... cualquier otro código existente ...
  
    def self.ransackable_attributes(auth_object = nil)
      %w[numero_orden numero_remito nombre apellido dni destino celular estado fecha_inicio]
    end
  
    # ... cualquier otro código existente ...
  end
  