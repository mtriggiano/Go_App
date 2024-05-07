class UserMailer < ApplicationMailer
  default from: 'webmaster@grupoorange.com.ar'

  # Método para enviar un correo de bienvenida
  def welcome_email
    mail(to: 'mtg@grupoorange.com.ar', subject: 'Bienvenido/a a Nuestra Aplicación')
  end
end
