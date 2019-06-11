Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :flats, only: [:index, :show, :create, :new] do
    resources :bookings, except: [:show]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show] do
  resources  :reviews, only: [:new, :create]
  end
end
