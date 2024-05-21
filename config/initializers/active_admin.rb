# config/initializers/active_admin.rb
ActiveAdmin.setup do |config|
  config.site_title = "Go App"
  config.default_namespace = :admin
  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.root_to = 'dashboard#index'
  config.batch_actions = true
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]
  config.localize_format = :long

  # Configura CanCanCan
  config.authorization_adapter = ActiveAdmin::CanCanAdapter

  config.namespace :admin do |admin|
    admin.build_menu :default do |menu|
      menu.add label: "Gestión de Usuarios", priority: 1, url: -> { user_management_admin_users_path }
    end
  end

  config.namespace :user_management do |user_management|
    user_management.site_title = "Gestión de Usuarios"
    user_management.build_menu :default do |menu|
      menu.add label: "Admin Users", priority: 1, url: -> { user_management_admin_users_path }
      menu.add label: "Users", priority: 2, url: -> { user_management_users_path }
      menu.add label: "Roles", priority: 3, url: -> { user_management_roles_path }
      menu.add label: "Permissions", priority: 4, url: -> { user_management_permissions_path }
      menu.add label: "Role Assignments", priority: 5, url: -> { user_management_role_assignments_path }
      menu.add label: "Volver Atrás", priority: 6, url: -> { admin_root_path }
    end
  end
end
