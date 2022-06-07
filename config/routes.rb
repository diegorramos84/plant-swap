Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :plants do
    resources :bookings, only: %i[new create]
  end
end
