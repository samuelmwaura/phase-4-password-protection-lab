Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/signup', to: "users#create"  #Creating new users
  get "/me", to: "users#show" #Gets the logged_in user
  post "/login", to: "sessions#create" #Route for logging in a user
  delete "/logout", to:"sessions#destroy" #Route for logging out a user
  get "/me", to: "users#show" #Route to get the logged in user
end
