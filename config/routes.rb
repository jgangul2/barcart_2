Rails.application.routes.draw do
  resources :spirits_details
  resources :cocktail_details
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
