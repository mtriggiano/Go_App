module Admin
    class ClientesController < ActiveAdmin::ResourceController
        # Otros métodos necesarios para tu administrador aquí

        # Método para búsqueda AJAX
        def search
            @clientes = Cliente.ransack(nombre_cont: params[:q]).result.limit(5)
            render json: @clientes.map { |cliente|
                { id: cliente.id, text: "#{cliente.nombre} #{cliente.apellido} - #{cliente.dni_cuit}" }
            }
        end
    end
end
