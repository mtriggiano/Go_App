# app/controllers/orden_trabajos_controller.rb
class OrdenTrabajosController < ApplicationController
    load_and_authorize_resource
  
    def index
      # @orden_trabajos ya estará cargado y filtrado según las habilidades del usuario
    end
  
    # Más acciones aquí
  end
  