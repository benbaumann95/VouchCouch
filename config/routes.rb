Rails.application.routes.draw do
  get 'bookings/create'

  devise_for :users

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'voucher_file', to: 'pages#voucher_file'
  resources :vouchers do
    resources :bookings, only: [:create]
  end

  get 'vouchers/group/:name', to: 'vouchers#show_group', as: 'vouchers_group'
end
