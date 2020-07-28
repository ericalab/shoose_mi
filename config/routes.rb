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
    resources :products, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :sales_records, only: [:index]
    resources :users, only: [:index]
  end

  # Rails.application.routes.draw do
  #   devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  #   }
  # end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
