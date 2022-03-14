class CocktailRecipesStandardsController < ApplicationController
  before_action :set_cocktail_recipes_standard,
                only: %i[show edit update destroy]

  def index
    @q = CocktailRecipesStandard.ransack(params[:q])
    @cocktail_recipes_standards = @q.result(distinct: true).includes(
      :cocktail, :ingredient
    ).page(params[:page]).per(10)
  end

  def show; end

  def new
    @cocktail_recipes_standard = CocktailRecipesStandard.new
  end

  def edit; end

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

  def update
    if @cocktail_recipes_standard.update(cocktail_recipes_standard_params)
      redirect_to @cocktail_recipes_standard,
                  notice: "Cocktail recipes standard was successfully updated."
    else
      render :edit
    end
  end

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

  def set_cocktail_recipes_standard
    @cocktail_recipes_standard = CocktailRecipesStandard.find(params[:id])
  end

  def cocktail_recipes_standard_params
    params.require(:cocktail_recipes_standard).permit(:cocktail_id,
                                                      :ingredient_id, :quantity)
  end
end
