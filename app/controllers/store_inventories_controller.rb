class StoreInventoriesController < ApplicationController
  before_action :set_store_inventory, only: [:show, :edit, :update, :destroy]

  # GET /store_inventories
  def index
    @store_inventories = StoreInventory.all
  end

  # GET /store_inventories/1
  def show
  end

  # GET /store_inventories/new
  def new
    @store_inventory = StoreInventory.new
  end

  # GET /store_inventories/1/edit
  def edit
  end

  # POST /store_inventories
  def create
    @store_inventory = StoreInventory.new(store_inventory_params)

    if @store_inventory.save
      redirect_to @store_inventory, notice: 'Store inventory was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /store_inventories/1
  def update
    if @store_inventory.update(store_inventory_params)
      redirect_to @store_inventory, notice: 'Store inventory was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /store_inventories/1
  def destroy
    @store_inventory.destroy
    redirect_to store_inventories_url, notice: 'Store inventory was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_inventory
      @store_inventory = StoreInventory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_inventory_params
      params.require(:store_inventory).permit(:store_id, :price, :ingredient_id)
    end
end