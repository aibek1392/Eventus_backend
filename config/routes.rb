Rails.application.routes.draw do
  resources :favorite_events
  resources :user_events
  resources :event_comments
  resources :events
  resources :users, only: [:index, :show, :create]
  resources :login, only: [:create]

  # 

  # post '/login', to: 'login#login'
  # get '/profile', to: 'users#profile'
  # post '/signup', to: 'users#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
