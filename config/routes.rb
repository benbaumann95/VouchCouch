Rails.application.routes.draw do
  get 'bookings/create'

  devise_for :users

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :vouchers do
    resources :bookings, only: [:create]
  end

  # resources :users, only: [] do
  #   resources :vouchers
  # end
end
