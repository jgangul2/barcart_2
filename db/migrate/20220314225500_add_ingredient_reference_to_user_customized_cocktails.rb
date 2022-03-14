class AddIngredientReferenceToUserCustomizedCocktails < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_customized_cocktails, :spirits_brands,
                    column: :ingredient_id
    add_index :user_customized_cocktails, :ingredient_id
    change_column_null :user_customized_cocktails, :ingredient_id, false
  end
end
