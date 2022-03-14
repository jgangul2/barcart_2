class Api::V1::UserBarCartsController < Api::V1::GraphitiController
  def index
    user_bar_carts = UserBarCartResource.all(params)
    respond_with(user_bar_carts)
  end

  def show
    user_bar_cart = UserBarCartResource.find(params)
    respond_with(user_bar_cart)
  end

  def create
    user_bar_cart = UserBarCartResource.build(params)

    if user_bar_cart.save
      render jsonapi: user_bar_cart, status: 201
    else
      render jsonapi_errors: user_bar_cart
    end
  end

  def update
    user_bar_cart = UserBarCartResource.find(params)

    if user_bar_cart.update_attributes
      render jsonapi: user_bar_cart
    else
      render jsonapi_errors: user_bar_cart
    end
  end

  def destroy
    user_bar_cart = UserBarCartResource.find(params)

    if user_bar_cart.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: user_bar_cart
    end
  end
end
