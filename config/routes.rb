Rails.application.routes.draw do
  # Devise routes for ActiveAdmin and regular users
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  
  # ActiveAdmin routes
  ActiveAdmin.routes(self)
  
  # Regular resource for roles
  resources :roles

  # Namespace for custom admin actions
  namespace :admin do
    get 'clientes/search', to: 'clientes#search', as: :search_clientes
  end

  # Custom route for health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Routes for image and upload handling
  post 'images/upload', to: 'images#upload'
  post 'uploads/create', to: 'uploads#create'

  # Example root path, uncomment and adjust as needed
  # root "posts#index"
end
