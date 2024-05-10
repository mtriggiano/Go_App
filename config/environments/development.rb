Rails.application.configure do
  # Código existente...

  config.eager_load = false  # Asegúrate de que está en false para desarrollo

  # Configuración de Action Mailer
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'mail.grupoorange.com.ar',
    port: 587,
    domain: 'grupoorange.com.ar',
    user_name: 'webmaster@grupoorange.com.ar',
    password: '1LzIX(GNDHo9',
    authentication: 'plain',
    enable_starttls_auto: true
  }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_url_options = { host: '192.168.0.198', port: 3000 }
  
  # Otros ajustes...

  # Niveles de log: :debug, :info, :warn, :error, :fatal, :unknown
  config.log_level = :debug

end
