class CocktailDetailsController < ApplicationController
  before_action :set_cocktail_detail, only: %i[show edit update destroy]

  def index
    @q = CocktailDetail.ransack(params[:q])
    @cocktail_details = @q.result(distinct: true).includes(
      :cocktail_recipes_standards, :cocktail_favorites_users, :user_customized_cocktails
    ).page(params[:page]).per(10)
  end

  def show
    @user_customized_cocktail = UserCustomizedCocktail.new
    @cocktail_favorites_user = CocktailFavoritesUser.new
    @cocktail_recipes_standard = CocktailRecipesStandard.new
  end

  def new
    @cocktail_detail = CocktailDetail.new
  end

  def edit; end

  def create
    @cocktail_detail = CocktailDetail.new(cocktail_detail_params)

    if @cocktail_detail.save
      redirect_to @cocktail_detail,
                  notice: "Cocktail detail was successfully created."
    else
      render :new
    end
  end

  def update
    if @cocktail_detail.update(cocktail_detail_params)
      redirect_to @cocktail_detail,
                  notice: "Cocktail detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @cocktail_detail.destroy
    redirect_to cocktail_details_url,
                notice: "Cocktail detail was successfully destroyed."
  end

  private

  def set_cocktail_detail
    @cocktail_detail = CocktailDetail.find(params[:id])
  end

  def cocktail_detail_params
    params.require(:cocktail_detail).permit(:name, :description, :image_url)
  end
end
