class Api::V1::CocktailFavoritesUsersController < Api::V1::GraphitiController
  def index
    cocktail_favorites_users = CocktailFavoritesUserResource.all(params)
    respond_with(cocktail_favorites_users)
  end

  def show
    cocktail_favorites_user = CocktailFavoritesUserResource.find(params)
    respond_with(cocktail_favorites_user)
  end

  def create
    cocktail_favorites_user = CocktailFavoritesUserResource.build(params)

    if cocktail_favorites_user.save
      render jsonapi: cocktail_favorites_user, status: :created
    else
      render jsonapi_errors: cocktail_favorites_user
    end
  end

  def update
    cocktail_favorites_user = CocktailFavoritesUserResource.find(params)

    if cocktail_favorites_user.update_attributes
      render jsonapi: cocktail_favorites_user
    else
      render jsonapi_errors: cocktail_favorites_user
    end
  end

  def destroy
    cocktail_favorites_user = CocktailFavoritesUserResource.find(params)

    if cocktail_favorites_user.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: cocktail_favorites_user
    end
  end
end
