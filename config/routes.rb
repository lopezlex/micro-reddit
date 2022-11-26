Rails.application.routes.draw do
  root 'posts#index'

  resource :session, only: [:new, :create, :destroy]

  # get 'users/index'
  resources :users
  get 'signup' => 'users#new'

  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
