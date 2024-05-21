# app/controllers/orden_trabajos_controller.rb
class OrdenTrabajosController < ApplicationController
  before_action :set_orden_trabajo, only: [:show, :edit, :update, :destroy]
  before_action :authorize_access

  def index
    authorize! :read, OrdenTrabajo
    @orden_trabajos = OrdenTrabajo.all
  end

  def show
    authorize! :read, OrdenTrabajo
  end

  def new
    authorize! :create, OrdenTrabajo
    @orden_trabajo = OrdenTrabajo.new
  end

  def create
    authorize! :create, OrdenTrabajo
    @orden_trabajo = OrdenTrabajo.new(orden_trabajo_params)
    if @orden_trabajo.save
      redirect_to orden_trabajos_path, notice: 'Orden de Trabajo creada correctamente.'
    else
      render :new
    end
  end

  def edit
    authorize! :update, OrdenTrabajo
  end

  def update
    authorize! :update, OrdenTrabajo
    if @orden_trabajo.update(orden_trabajo_params)
      redirect_to orden_trabajos_path, notice: 'Orden de Trabajo actualizada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    authorize! :destroy, OrdenTrabajo
    @orden_trabajo.destroy
    redirect_to orden_trabajos_path, notice: 'Orden de Trabajo eliminada correctamente.'
  end

  private

  def set_orden_trabajo
    @orden_trabajo = OrdenTrabajo.find(params[:id])
  end

  def orden_trabajo_params
    params.require(:orden_trabajo).permit(:numero_remito, :fecha_inicio, :destino, :contacto, :celular, :estado, :cliente_id, :numero_presupuesto, :detalle_tareas, :tipo_ordens)
  end

  def authorize_access
    authorize! :manage, OrdenTrabajo
  end
end
