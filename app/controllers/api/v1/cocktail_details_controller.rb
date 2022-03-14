class Api::V1::CocktailDetailsController < Api::V1::GraphitiController
  def index
    cocktail_details = CocktailDetailResource.all(params)
    respond_with(cocktail_details)
  end

  def show
    cocktail_detail = CocktailDetailResource.find(params)
    respond_with(cocktail_detail)
  end

  def create
    cocktail_detail = CocktailDetailResource.build(params)

    if cocktail_detail.save
      render jsonapi: cocktail_detail, status: :created
    else
      render jsonapi_errors: cocktail_detail
    end
  end

  def update
    cocktail_detail = CocktailDetailResource.find(params)

    if cocktail_detail.update_attributes
      render jsonapi: cocktail_detail
    else
      render jsonapi_errors: cocktail_detail
    end
  end

  def destroy
    cocktail_detail = CocktailDetailResource.find(params)

    if cocktail_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: cocktail_detail
    end
  end
end
