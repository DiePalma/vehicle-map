Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    namespace :v1 do
      #get 'gps', to: 'waypoints#index'
      get 'show', to: 'waypoints#show'
      post 'gps', to: 'waypoints#create' 
      patch 'gps/:id', to: 'waypoints#update'
      delete 'gps/:id', to: 'waypoints#destroy'
     # resources :waypoints, only: [:index, :show, :create, :update, :destroy]
    end
  end
  
end
