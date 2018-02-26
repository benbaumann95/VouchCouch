Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :vouchers, only: [:show, :index]
  resources :users, only: [] do
    resources :vouchers
  end



end
