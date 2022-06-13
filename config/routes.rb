Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users
  root to: "pages#home"
  resources :users, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get '/reply_buy', to: 'bookings#reply_buy'

  resources :bookings, only: %i[index show] do
    resources :reviews, only: %i[new create show]
  end

  resources :plants do
    resources :bookings, only: %i[new create]
  end

  resources :rooms do
    resources :messages
  end
end
