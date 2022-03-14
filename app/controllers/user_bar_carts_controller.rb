class UserBarCartsController < ApplicationController
  before_action :set_user_bar_cart, only: %i[show edit update destroy]

  def index
    @q = UserBarCart.ransack(params[:q])
    @user_bar_carts = @q.result(distinct: true).includes(:user,
                                                         :spirit_brand).page(params[:page]).per(10)
  end

  def show; end

  def new
    @user_bar_cart = UserBarCart.new
  end

  def edit; end

  def create
    @user_bar_cart = UserBarCart.new(user_bar_cart_params)

    if @user_bar_cart.save
      message = "UserBarCart was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @user_bar_cart, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @user_bar_cart.update(user_bar_cart_params)
      redirect_to @user_bar_cart,
                  notice: "User bar cart was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_bar_cart.destroy
    message = "UserBarCart was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to user_bar_carts_url, notice: message
    end
  end

  private

  def set_user_bar_cart
    @user_bar_cart = UserBarCart.find(params[:id])
  end

  def user_bar_cart_params
    params.require(:user_bar_cart).permit(:user_id, :spirit_brand_id,
                                          :quantity)
  end
end
