Rails.application.routes.draw do
  resources :user_bar_carts
  resources :spirits_brands
  resources :store_inventories
  resources :stores
  resources :cocktail_favorites_users
  resources :cocktail_recipes_standards
  resources :spirits_details
  resources :cocktail_details
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
