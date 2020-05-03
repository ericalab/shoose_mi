Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :products, only: [:new, :show, :create] do
    scope module: :products do
      resouces :add_to_baskets, only: [:create]
      resouces :delete_in_baskets, only: [:create]
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
