Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  resources :searches
end
