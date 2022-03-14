class AddUserReferenceToCocktailFavoritesUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cocktail_favorites_users, :users
    add_index :cocktail_favorites_users, :user_id
    change_column_null :cocktail_favorites_users, :user_id, false
  end
end
