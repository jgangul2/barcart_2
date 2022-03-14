class CocktailFavoritesUsersController < ApplicationController
  before_action :set_cocktail_favorites_user, only: [:show, :edit, :update, :destroy]

  # GET /cocktail_favorites_users
  def index
    @cocktail_favorites_users = CocktailFavoritesUser.all
  end

  # GET /cocktail_favorites_users/1
  def show
  end

  # GET /cocktail_favorites_users/new
  def new
    @cocktail_favorites_user = CocktailFavoritesUser.new
  end

  # GET /cocktail_favorites_users/1/edit
  def edit
  end

  # POST /cocktail_favorites_users
  def create
    @cocktail_favorites_user = CocktailFavoritesUser.new(cocktail_favorites_user_params)

    if @cocktail_favorites_user.save
      redirect_to @cocktail_favorites_user, notice: 'Cocktail favorites user was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cocktail_favorites_users/1
  def update
    if @cocktail_favorites_user.update(cocktail_favorites_user_params)
      redirect_to @cocktail_favorites_user, notice: 'Cocktail favorites user was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cocktail_favorites_users/1
  def destroy
    @cocktail_favorites_user.destroy
    message = "CocktailFavoritesUser was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to cocktail_favorites_users_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail_favorites_user
      @cocktail_favorites_user = CocktailFavoritesUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cocktail_favorites_user_params
      params.require(:cocktail_favorites_user).permit(:user_id, :cocktail_id)
    end
end
