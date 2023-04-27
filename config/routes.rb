Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/show'
  get 'recipes/new'
  get 'recipes/create'
  get 'recipes/destroy'
  # post '/users/:user_id/recipes/new', to: 'recipes#create', as: 'create_recipe'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"


  resources :users do
    resources :foods
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods
    end
  
  end
end
