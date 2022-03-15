class AddCocktailReferenceToUserCustomizedCocktails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_customized_cocktails, :cocktail_details,
                    column: :cocktail_id
    add_index :user_customized_cocktails, :cocktail_id
    change_column_null :user_customized_cocktails, :cocktail_id, false
  end
end
