# config/initializers/rolify.rb
Rolify.configure do |config|
  # By default ORM adapter is ActiveRecord. uncomment to use mongoid
  # config.use_mongoid

  # Role join table configuration. By default it's set to 'users_roles'
  config.use_dynamic_shortcuts

  # Set method to be called if strategy :find is used
  # config.resource_role_strategy = :scope
end
