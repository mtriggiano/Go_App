Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)

  namespace :user_management do
    resources :admin_users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :roles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :permissions, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :role_assignments, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    get 'clientes/search', to: 'clientes#search', as: :search_clientes
  end

  get "up" => "rails/health#show", as: :rails_health_check

  post 'images/upload', to: 'images#upload'
  post 'uploads/create', to: 'uploads#create'
end
