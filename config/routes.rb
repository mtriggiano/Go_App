Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  namespace :admin do
    get 'clientes/search', to: 'clientes#search', as: :search_clientes
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

# config/routes.rb
Rails.application.routes.draw do
  post 'images/upload', to: 'images#upload'
end

# config/routes.rb
Rails.application.routes.draw do
  post 'uploads/create', to: 'uploads#create'
end

