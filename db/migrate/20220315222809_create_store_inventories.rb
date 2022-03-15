class CreateStoreInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :store_inventories do |t|
      t.integer :store_id
      t.integer :price
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
