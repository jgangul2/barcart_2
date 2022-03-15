class CreateUserCustomizedCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_customized_cocktails do |t|
      t.integer :user_id
      t.integer :cocktail_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
