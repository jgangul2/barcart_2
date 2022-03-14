json.extract! store_inventory, :id, :store_id, :price, :ingredient_id, :created_at, :updated_at
json.url store_inventory_url(store_inventory, format: :json)
