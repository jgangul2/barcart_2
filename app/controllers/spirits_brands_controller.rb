class SpiritsBrandsController < ApplicationController
  before_action :set_spirits_brand, only: [:show, :edit, :update, :destroy]

  # GET /spirits_brands
  def index
    @spirits_brands = SpiritsBrand.page(params[:page]).per(10)
  end

  # GET /spirits_brands/1
  def show
    @user_customized_cocktail = UserCustomizedCocktail.new
    @user_bar_cart = UserBarCart.new
    @store_inventory = StoreInventory.new
  end

  # GET /spirits_brands/new
  def new
    @spirits_brand = SpiritsBrand.new
  end

  # GET /spirits_brands/1/edit
  def edit
  end

  # POST /spirits_brands
  def create
    @spirits_brand = SpiritsBrand.new(spirits_brand_params)

    if @spirits_brand.save
      message = 'SpiritsBrand was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @spirits_brand, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /spirits_brands/1
  def update
    if @spirits_brand.update(spirits_brand_params)
      redirect_to @spirits_brand, notice: 'Spirits brand was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spirits_brands/1
  def destroy
    @spirits_brand.destroy
    message = "SpiritsBrand was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to spirits_brands_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spirits_brand
      @spirits_brand = SpiritsBrand.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spirits_brand_params
      params.require(:spirits_brand).permit(:spirit_id, :name, :description)
    end
end
