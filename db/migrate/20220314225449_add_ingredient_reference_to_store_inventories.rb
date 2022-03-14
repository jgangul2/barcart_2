class AddIngredientReferenceToStoreInventories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :store_inventories, :spirits_brands, column: :ingredient_id
    add_index :store_inventories, :ingredient_id
    change_column_null :store_inventories, :ingredient_id, false
  end
end
