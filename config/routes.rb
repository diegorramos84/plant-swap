Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: %i[index show] do
    resources :reviews, only: %i[new create show]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get '/reply_booking', to: 'bookings#reply_buy'
  get '/my_bookings', to: 'bookings#my_bookings'

  resources :plants do
    resources :bookings, only: %i[new create]
  end
end
