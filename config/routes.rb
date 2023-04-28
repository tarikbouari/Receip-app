Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "public_recipes#index"


  resources :users do
    resources :foods
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods
    end
  end
<<<<<<< HEAD
  resources :public_recipes
=======
>>>>>>> ea90dd1e32e23b987abca5b1494e7ecb279897a0
end
