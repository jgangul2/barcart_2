class CocktailFavoritesUsersController < ApplicationController
  before_action :current_user_must_be_cocktail_favorites_user_user,
                only: %i[edit update destroy]

  before_action :set_cocktail_favorites_user,
                only: %i[show edit update destroy]

  def index
    @q = CocktailFavoritesUser.ransack(params[:q])
    @cocktail_favorites_users = @q.result(distinct: true).includes(:user,
                                                                   :cocktail).page(params[:page]).per(10)
  end

  def show; end

  def new
    @cocktail_favorites_user = CocktailFavoritesUser.new
  end

  def edit; end

  def create
    @cocktail_favorites_user = CocktailFavoritesUser.new(cocktail_favorites_user_params)

    if @cocktail_favorites_user.save
      message = "CocktailFavoritesUser was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @cocktail_favorites_user, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @cocktail_favorites_user.update(cocktail_favorites_user_params)
      redirect_to @cocktail_favorites_user,
                  notice: "Cocktail favorites user was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @cocktail_favorites_user.destroy
    message = "CocktailFavoritesUser was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to cocktail_favorites_users_url, notice: message
    end
  end

  private

  def current_user_must_be_cocktail_favorites_user_user
    set_cocktail_favorites_user
    unless current_user == @cocktail_favorites_user.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_cocktail_favorites_user
    @cocktail_favorites_user = CocktailFavoritesUser.find(params[:id])
  end

  def cocktail_favorites_user_params
    params.require(:cocktail_favorites_user).permit(:user_id, :cocktail_id)
  end
end
