Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'flats/index'
  get 'flats/show'
  
  root to: 'pages#home'
  resources :flats, only: [:index, :show,]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end