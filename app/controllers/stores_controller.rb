class StoresController < ApplicationController
  before_action :set_store, only: %i[show edit update destroy]

  def index
    @q = Store.ransack(params[:q])
    @stores = @q.result(distinct: true).includes(:store_inventories,
                                                 :brand_ingredients).page(params[:page]).per(10)
  end

  def show
    @store_inventory = StoreInventory.new
  end

  def new
    @store = Store.new
  end

  def edit; end

  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to @store, notice: "Store was successfully created."
    else
      render :new
    end
  end

  def update
    if @store.update(store_params)
      redirect_to @store, notice: "Store was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_url, notice: "Store was successfully destroyed."
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:store_name, :location)
  end
end
