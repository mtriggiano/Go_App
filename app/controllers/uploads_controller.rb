# app/controllers/uploads_controller.rb
class UploadsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
  
    def create
      file = params[:file]
      file_path = Rails.root.join('public', 'uploads', file.original_filename)
      File.open(file_path, 'wb') do |f|
        f.write(file.read)
      end
      render json: { location: "/uploads/#{file.original_filename}" }
    end
  end
  