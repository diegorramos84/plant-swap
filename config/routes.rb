Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
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
    resources :chatrooms, only: :show
  end

  resources :plants do
    resources :bookings, only: %i[new create]
  end

  resources :chatrooms, except: :show do
    resources :messages, only: :create
  end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  match "/422", to: "errors#unprocessable_entity", via: :all
end
