class Api::V1::UserCustomizedCocktailsController < Api::V1::GraphitiController
  def index
    user_customized_cocktails = UserCustomizedCocktailResource.all(params)
    respond_with(user_customized_cocktails)
  end

  def show
    user_customized_cocktail = UserCustomizedCocktailResource.find(params)
    respond_with(user_customized_cocktail)
  end

  def create
    user_customized_cocktail = UserCustomizedCocktailResource.build(params)

    if user_customized_cocktail.save
      render jsonapi: user_customized_cocktail, status: :created
    else
      render jsonapi_errors: user_customized_cocktail
    end
  end

  def update
    user_customized_cocktail = UserCustomizedCocktailResource.find(params)

    if user_customized_cocktail.update_attributes
      render jsonapi: user_customized_cocktail
    else
      render jsonapi_errors: user_customized_cocktail
    end
  end

  def destroy
    user_customized_cocktail = UserCustomizedCocktailResource.find(params)

    if user_customized_cocktail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: user_customized_cocktail
    end
  end
end
