class CocktailRecipesStandardsController < ApplicationController
  before_action :set_cocktail_recipes_standard,
                only: %i[show edit update destroy]

  # GET /cocktail_recipes_standards
  def index
    @q = CocktailRecipesStandard.ransack(params[:q])
    @cocktail_recipes_standards = @q.result(distinct: true).includes(
      :cocktail, :ingredient
    ).page(params[:page]).per(10)
  end

  # GET /cocktail_recipes_standards/1
  def show; end

  # GET /cocktail_recipes_standards/new
  def new
    @cocktail_recipes_standard = CocktailRecipesStandard.new
  end

  # GET /cocktail_recipes_standards/1/edit
  def edit; end

  # POST /cocktail_recipes_standards
  def create
    @cocktail_recipes_standard = CocktailRecipesStandard.new(cocktail_recipes_standard_params)

    if @cocktail_recipes_standard.save
      message = "CocktailRecipesStandard was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @cocktail_recipes_standard, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /cocktail_recipes_standards/1
  def update
    if @cocktail_recipes_standard.update(cocktail_recipes_standard_params)
      redirect_to @cocktail_recipes_standard,
                  notice: "Cocktail recipes standard was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /cocktail_recipes_standards/1
  def destroy
    @cocktail_recipes_standard.destroy
    message = "CocktailRecipesStandard was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to cocktail_recipes_standards_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cocktail_recipes_standard
    @cocktail_recipes_standard = CocktailRecipesStandard.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cocktail_recipes_standard_params
    params.require(:cocktail_recipes_standard).permit(:cocktail_id,
                                                      :ingredient_id, :quantity)
  end
end
