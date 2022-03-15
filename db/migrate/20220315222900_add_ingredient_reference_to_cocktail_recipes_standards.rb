class AddIngredientReferenceToCocktailRecipesStandards < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cocktail_recipes_standards, :spirits_details,
                    column: :ingredient_id
    add_index :cocktail_recipes_standards, :ingredient_id
    change_column_null :cocktail_recipes_standards, :ingredient_id, false
  end
end
