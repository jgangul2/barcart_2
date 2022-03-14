class Api::V1::CocktailRecipesStandardsController < Api::V1::GraphitiController
  def index
    cocktail_recipes_standards = CocktailRecipesStandardResource.all(params)
    respond_with(cocktail_recipes_standards)
  end

  def show
    cocktail_recipes_standard = CocktailRecipesStandardResource.find(params)
    respond_with(cocktail_recipes_standard)
  end

  def create
    cocktail_recipes_standard = CocktailRecipesStandardResource.build(params)

    if cocktail_recipes_standard.save
      render jsonapi: cocktail_recipes_standard, status: 201
    else
      render jsonapi_errors: cocktail_recipes_standard
    end
  end

  def update
    cocktail_recipes_standard = CocktailRecipesStandardResource.find(params)

    if cocktail_recipes_standard.update_attributes
      render jsonapi: cocktail_recipes_standard
    else
      render jsonapi_errors: cocktail_recipes_standard
    end
  end

  def destroy
    cocktail_recipes_standard = CocktailRecipesStandardResource.find(params)

    if cocktail_recipes_standard.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: cocktail_recipes_standard
    end
  end
end
