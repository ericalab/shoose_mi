Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resource :basket, only: [:show]
  resource :charge, only: [:create]
  

  resources :products, only: [:show] do
    scope module: :products do
      resources :add_to_baskets, only: [:create]
      resources :delete_in_baskets, only: [:create]
    end
  end

  namespace :admins do
    root to: "dashboards#index"
    resources :products, only: [:new, :create]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
