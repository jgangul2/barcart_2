class StoreInventoriesController < ApplicationController
  before_action :set_store_inventory, only: %i[show edit update destroy]

  def index
    @q = StoreInventory.ransack(params[:q])
    @store_inventories = @q.result(distinct: true).includes(:store,
                                                            :ingredient, :spirit).page(params[:page]).per(10)
  end

  def show; end

  def new
    @store_inventory = StoreInventory.new
  end

  def edit; end

  def create
    @store_inventory = StoreInventory.new(store_inventory_params)

    if @store_inventory.save
      message = "StoreInventory was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @store_inventory, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @store_inventory.update(store_inventory_params)
      redirect_to @store_inventory,
                  notice: "Store inventory was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @store_inventory.destroy
    message = "StoreInventory was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to store_inventories_url, notice: message
    end
  end

  private

  def set_store_inventory
    @store_inventory = StoreInventory.find(params[:id])
  end

  def store_inventory_params
    params.require(:store_inventory).permit(:store_id, :price, :ingredient_id)
  end
end
