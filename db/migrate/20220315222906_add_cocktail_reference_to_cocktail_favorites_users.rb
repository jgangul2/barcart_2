class AddCocktailReferenceToCocktailFavoritesUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cocktail_favorites_users, :cocktail_details,
                    column: :cocktail_id
    add_index :cocktail_favorites_users, :cocktail_id
    change_column_null :cocktail_favorites_users, :cocktail_id, false
  end
end
