class CreateCocktailRecipesStandards < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktail_recipes_standards do |t|
      t.integer :cocktail_id
      t.integer :ingredient_id
      t.float :quantity

      t.timestamps
    end
  end
end
