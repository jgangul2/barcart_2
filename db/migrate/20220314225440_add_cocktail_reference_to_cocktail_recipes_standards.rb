class AddCocktailReferenceToCocktailRecipesStandards < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cocktail_recipes_standards, :cocktail_details, column: :cocktail_id
    add_index :cocktail_recipes_standards, :cocktail_id
    change_column_null :cocktail_recipes_standards, :cocktail_id, false
  end
end
