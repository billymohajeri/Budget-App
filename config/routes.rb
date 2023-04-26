Rails.application.routes.draw do
  get 'operations/index'
  get 'user/index'
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :operations
  resources :categories, only: [:index, :show, :new, :create] do
    get 'operations', to: 'operations#index', as: 'operations'
  end
  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'categories#index'
end