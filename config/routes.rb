Rails.application.routes.draw do
  get '/users/current' => "users#current"
  resources :comments
  resources :posts
  resources :users
  resources :searches
end
