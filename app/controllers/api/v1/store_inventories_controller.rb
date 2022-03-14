class Api::V1::StoreInventoriesController < Api::V1::GraphitiController
  def index
    store_inventories = StoreInventoryResource.all(params)
    respond_with(store_inventories)
  end

  def show
    store_inventory = StoreInventoryResource.find(params)
    respond_with(store_inventory)
  end

  def create
    store_inventory = StoreInventoryResource.build(params)

    if store_inventory.save
      render jsonapi: store_inventory, status: :created
    else
      render jsonapi_errors: store_inventory
    end
  end

  def update
    store_inventory = StoreInventoryResource.find(params)

    if store_inventory.update_attributes
      render jsonapi: store_inventory
    else
      render jsonapi_errors: store_inventory
    end
  end

  def destroy
    store_inventory = StoreInventoryResource.find(params)

    if store_inventory.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: store_inventory
    end
  end
end
