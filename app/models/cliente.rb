class Cliente < ApplicationRecord
    # Validaciones
  validates :dni_cuit, uniqueness: { message: "ya está registrado en otro cliente" }
    
    # Lista blanca de atributos que se pueden buscar
    def self.ransackable_attributes(auth_object = nil)
      %w[nombre apellido dni_cuit direccion email celular]
    end
  
    # Asumiendo que no tienes asociaciones o que no quieres que sean buscables por ahora
    def self.ransackable_associations(auth_object = nil)
      []
    end
  end
  