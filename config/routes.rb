Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
  resources :users
  resources :sessions
  resources :intentions do
    resources :cheers
  end
  resources :goal_comments
  resources :user_comments
  resources :likes
end
