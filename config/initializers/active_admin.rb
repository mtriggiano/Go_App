# config/initializers/active_admin.rb
ActiveAdmin.setup do |config|
  # == Site Title
  config.site_title = "Go App"

  # == Default Namespace
  config.default_namespace = :admin

  # == User Authentication
  config.authentication_method = :authenticate_admin_user!

  # == Current User
  config.current_user_method = :current_admin_user

  # == Logging Out
  config.logout_link_path = :destroy_admin_user_session_path

  # == Root
  config.root_to = 'dashboard#index'

  # == Batch Actions
  config.batch_actions = true

  # == Attribute Filters
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  # == Localize Date/Time Format
  config.localize_format = :long

  # == Register Stylesheets & Javascripts
  # config.register_stylesheet 'my_stylesheet.css'
  # config.register_stylesheet 'my_print_stylesheet.css', media: :print
  # config.register_javascript 'my_javascript.js'

  # == CSV options
  # config.csv_options = { col_sep: ';' }
  # config.csv_options = { force_quotes: true }

  # == Menu System
  config.namespace :admin do |admin|
    admin.build_menu :default do |menu|
      menu.add label: "Gestión de Usuarios", priority: 1, url: -> { user_management_admin_users_path }
    end
  end

  config.namespace :user_management do |admin|
    admin.site_title = "Gestión de Usuarios"
    admin.build_menu :default do |menu|
      menu.add label: "Admin Users", priority: 1, url: -> { user_management_admin_users_path }
      menu.add label: "Users", priority: 2, url: -> { user_management_users_path }
      menu.add label: "Roles", priority: 3, url: -> { user_management_roles_path }
      menu.add label: "Permissions", priority: 4, url: -> { user_management_permissions_path }
      menu.add label: "Volver Atrás", priority: 5, url: -> { admin_root_path }
    end
  end
end
