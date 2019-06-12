Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :flats, only: [:home, :index, :show, :create, :new] do
    resources :bookings, except: [:show, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show, :update] do
  resources  :reviews, only: [:new, :create]
  end
 resources :dashboards, only: [:index]

end
