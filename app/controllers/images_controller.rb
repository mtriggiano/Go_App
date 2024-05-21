# app/controllers/images_controller.rb
class ImagesController < ApplicationController
  def upload
    image = Image.new(file: params[:file])  # Asumiendo que Image es tu modelo con montador CarrierWave o ActiveStorage
    if image.save
      render json: { location: url_for(image.file) }
    else
      render json: { error: 'Failed to upload image.' }, status: :unprocessable_entity
    end
  end
end
