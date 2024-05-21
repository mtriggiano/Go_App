# app/controllers/clientes_controller.rb
class ClientesController < ApplicationController
    before_action :set_cliente, only: [:show, :edit, :update, :destroy]
    before_action :authorize_access
  
    def index
      authorize! :read, Cliente
      @clientes = Cliente.all
    end
  
    def show
      authorize! :read, Cliente
    end
  
    def new
      authorize! :create, Cliente
      @cliente = Cliente.new
    end
  
    def create
      authorize! :create, Cliente
      @cliente = Cliente.new(cliente_params)
      if @cliente.save
        redirect_to clientes_path, notice: 'Cliente creado correctamente.'
      else
        render :new
      end
    end
  
    def edit
      authorize! :update, Cliente
    end
  
    def update
      authorize! :update, Cliente
      if @cliente.update(cliente_params)
        redirect_to clientes_path, notice: 'Cliente actualizado correctamente.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize! :destroy, Cliente
      @cliente.destroy
      redirect_to clientes_path, notice: 'Cliente eliminado correctamente.'
    end
  
    private
  
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end
  
    def cliente_params
      params.require(:cliente).permit(:nombre, :apellido, :dni_cuit, :direccion, :email, :celular)
    end
  
    def authorize_access
      authorize! :manage, Cliente
    end
  end
  