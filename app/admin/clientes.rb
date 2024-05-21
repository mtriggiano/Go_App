ActiveAdmin.register Cliente do
  menu priority: 3

  permit_params :nombre, :apellido, :dni_cuit, :direccion, :email, :celular

  index do
    selectable_column
    id_column
    column :nombre
    column :apellido
    column :dni_cuit
    column :direccion
    column :email
    column :celular
    actions
  end

  form do |f|
    f.inputs do
      f.input :nombre
      f.input :apellido
      f.input :dni_cuit
      f.input :direccion
      f.input :email
      f.input :celular
    end
    f.actions
  end

  show do
    attributes_table do
      row :nombre
      row :apellido
      row :dni_cuit
      row :direccion
      row :email
      row :celular
    end
  end

  controller do
    def search
      clients = Cliente.ransack(nombre_or_apellido_or_dni_cuit_cont: params[:q]).result(distinct: true)
      render json: clients.map { |client| { id: client.id, text: "#{client.nombre} #{client.apellido} - #{client.dni_cuit}" } }
    end

    private

    def authorize_access
      authorize! :manage, Cliente
    end
  end

  member_action :send_invitation, method: :post do
    cliente = Cliente.find_by(id: params[:id])
    if cliente
      ClientMailer.invitation_email(cliente).deliver_now
      redirect_to admin_cliente_path(cliente), notice: "Invitación enviada correctamente a #{cliente.email}"
    else
      redirect_to admin_clientes_path, alert: "Cliente no encontrado."
    end
  end

  action_item :send_invitation, only: :edit do
    link_to 'Enviar Invitación', send_invitation_admin_cliente_path(resource), method: :post
  end
end
