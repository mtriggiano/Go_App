# app/mailers/client_mailer.rb
class ClientMailer < ApplicationMailer
    def invitation_email(cliente)
      @cliente = cliente
      mail(to: @cliente.email, subject: 'Bienvenido a Nuestra Plataforma - Crea tu Usuario')
    end
  end
  