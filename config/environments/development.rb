Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'mail.grupoorange.com.ar',  # El servidor SMTP de tu hosting
    port: 587,                      # El puerto SMTP, comúnmente es 587 para TLS
    domain: 'grupoorange.com.ar',        # Tu dominio
    user_name: 'webmaster@grupoorange.com.ar',  # Tu correo electrónico completo
    password: '1LzIX(GNDHo9',      # Tu contraseña
    authentication: 'plain',        # Método de autenticación, puede ser 'plain', 'login' o 'cram_md5'
    enable_starttls_auto: true      # Auto-detecta TLS para una conexión segura
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true

    # Define el host para el enlace en los correos, ajusta según sea necesario
    config.action_mailer.default_url_options = { host: '192.168.0.198', port: 3000 }
end
