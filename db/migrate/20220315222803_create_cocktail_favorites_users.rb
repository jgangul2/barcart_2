class CreateCocktailFavoritesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_favorites_users do |t|
      t.integer :user_id
      t.integer :cocktail_id

      t.timestamps
    end
  end
end
