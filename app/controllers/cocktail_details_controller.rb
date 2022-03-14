class CocktailDetailsController < ApplicationController
  before_action :set_cocktail_detail, only: [:show, :edit, :update, :destroy]

  # GET /cocktail_details
  def index
    @cocktail_details = CocktailDetail.page(params[:page]).per(10)
  end

  # GET /cocktail_details/1
  def show
    @user_customized_cocktail = UserCustomizedCocktail.new
    @cocktail_favorites_user = CocktailFavoritesUser.new
    @cocktail_recipes_standard = CocktailRecipesStandard.new
  end

  # GET /cocktail_details/new
  def new
    @cocktail_detail = CocktailDetail.new
  end

  # GET /cocktail_details/1/edit
  def edit
  end

  # POST /cocktail_details
  def create
    @cocktail_detail = CocktailDetail.new(cocktail_detail_params)

    if @cocktail_detail.save
      redirect_to @cocktail_detail, notice: 'Cocktail detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cocktail_details/1
  def update
    if @cocktail_detail.update(cocktail_detail_params)
      redirect_to @cocktail_detail, notice: 'Cocktail detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cocktail_details/1
  def destroy
    @cocktail_detail.destroy
    redirect_to cocktail_details_url, notice: 'Cocktail detail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail_detail
      @cocktail_detail = CocktailDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cocktail_detail_params
      params.require(:cocktail_detail).permit(:name, :description, :image_url)
    end
end
