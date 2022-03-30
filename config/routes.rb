Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
<<<<<<< HEAD
  # root "articles#index"
=======
  root "users#index"
  resources :users
>>>>>>> parent of 9f21dd8 (adding integretion and end to end sweet tests)
end
