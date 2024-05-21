# app/controllers/articles_controller.rb
class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    # Aquí puedes añadir el código para recuperar y mostrar los artículos
  end

  def show
    # Código para mostrar un artículo específico
  end

  # Añade más acciones según sea necesario
end
