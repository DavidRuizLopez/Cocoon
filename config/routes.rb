Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resource :category
  resource :hotel, only: [:show] do
    resources :roomtypes, only: %i[create new show] do
      resources :bookings, only: %i[create new] do
        resources :payments, only: :new
        get 'confirmation', to: 'bookings#confirmation'
        get 'confirmation_payment', to: 'payments#confirmation_payment'
        # resources :reviews, only: %i[index create new]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
