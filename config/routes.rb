Rails.application.routes.draw do
  resources :comments
  devise_for :users
  root "items#index"
  resources :items
  # resources :buys, only:[:index, :new, :create] 
end
