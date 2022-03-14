Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :spirits_details

      resources :cocktail_details

      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "cocktail_details#index"
  resources :user_customized_cocktails
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
