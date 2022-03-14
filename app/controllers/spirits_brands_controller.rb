class SpiritsBrandsController < ApplicationController
  before_action :set_spirits_brand, only: [:show, :edit, :update, :destroy]

  # GET /spirits_brands
  def index
    @spirits_brands = SpiritsBrand.all
  end

  # GET /spirits_brands/1
  def show
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
      redirect_to @spirits_brand, notice: 'Spirits brand was successfully created.'
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
    redirect_to spirits_brands_url, notice: 'Spirits brand was successfully destroyed.'
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
