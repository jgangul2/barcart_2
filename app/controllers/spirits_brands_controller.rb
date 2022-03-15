class SpiritsBrandsController < ApplicationController
  before_action :set_spirits_brand, only: %i[show edit update destroy]

  def index
    @q = SpiritsBrand.ransack(params[:q])
    @spirits_brands = @q.result(distinct: true).includes(:spirit,
                                                         :store_inventories, :user_bar_carts, :user_customized_cocktails, :stores).page(params[:page]).per(10)
  end

  def show
    @user_customized_cocktail = UserCustomizedCocktail.new
    @user_bar_cart = UserBarCart.new
    @store_inventory = StoreInventory.new
  end

  def new
    @spirits_brand = SpiritsBrand.new
  end

  def edit; end

  def create
    @spirits_brand = SpiritsBrand.new(spirits_brand_params)

    if @spirits_brand.save
      message = "SpiritsBrand was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @spirits_brand, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @spirits_brand.update(spirits_brand_params)
      redirect_to @spirits_brand,
                  notice: "Spirits brand was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @spirits_brand.destroy
    message = "SpiritsBrand was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to spirits_brands_url, notice: message
    end
  end

  private

  def set_spirits_brand
    @spirits_brand = SpiritsBrand.find(params[:id])
  end

  def spirits_brand_params
    params.require(:spirits_brand).permit(:spirit_id, :name, :description)
  end
end
