Rails.application.routes.draw do
  get 'bookings/create'

  devise_for :users

  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'voucher_file', to: 'pages#voucher_file'
  resources :vouchers do
    resources :bookings, only: [:create, :destroy]
    post 'booking/no_display/:id', to: 'bookings#no_display', as: 'booking_no_display'
  end

  get 'vouchers/group/:name', to: 'vouchers#show_group', as: 'vouchers_group'
  post 'vouchers/no_display/:id', to: 'vouchers#no_display', as: 'voucher_no_display'
end
