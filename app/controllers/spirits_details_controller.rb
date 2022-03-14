class SpiritsDetailsController < ApplicationController
  before_action :set_spirits_detail, only: [:show, :edit, :update, :destroy]

  # GET /spirits_details
  def index
    @spirits_details = SpiritsDetail.page(params[:page]).per(10)
  end

  # GET /spirits_details/1
  def show
    @spirits_brand = SpiritsBrand.new
    @cocktail_recipes_standard = CocktailRecipesStandard.new
  end

  # GET /spirits_details/new
  def new
    @spirits_detail = SpiritsDetail.new
  end

  # GET /spirits_details/1/edit
  def edit
  end

  # POST /spirits_details
  def create
    @spirits_detail = SpiritsDetail.new(spirits_detail_params)

    if @spirits_detail.save
      redirect_to @spirits_detail, notice: 'Spirits detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /spirits_details/1
  def update
    if @spirits_detail.update(spirits_detail_params)
      redirect_to @spirits_detail, notice: 'Spirits detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /spirits_details/1
  def destroy
    @spirits_detail.destroy
    redirect_to spirits_details_url, notice: 'Spirits detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spirits_detail
      @spirits_detail = SpiritsDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def spirits_detail_params
      params.require(:spirits_detail).permit(:name)
    end
end
