class AddStoreReferenceToStoreInventories < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :store_inventories, :stores
    add_index :store_inventories, :store_id
    change_column_null :store_inventories, :store_id, false
  end
end
