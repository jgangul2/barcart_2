class UserBarCartsController < ApplicationController
  before_action :set_user_bar_cart, only: [:show, :edit, :update, :destroy]

  # GET /user_bar_carts
  def index
    @q = UserBarCart.ransack(params[:q])
    @user_bar_carts = @q.result(:distinct => true).includes(:user, :spirit_brand).page(params[:page]).per(10)
  end

  # GET /user_bar_carts/1
  def show
  end

  # GET /user_bar_carts/new
  def new
    @user_bar_cart = UserBarCart.new
  end

  # GET /user_bar_carts/1/edit
  def edit
  end

  # POST /user_bar_carts
  def create
    @user_bar_cart = UserBarCart.new(user_bar_cart_params)

    if @user_bar_cart.save
      message = 'UserBarCart was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @user_bar_cart, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /user_bar_carts/1
  def update
    if @user_bar_cart.update(user_bar_cart_params)
      redirect_to @user_bar_cart, notice: 'User bar cart was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_bar_carts/1
  def destroy
    @user_bar_cart.destroy
    message = "UserBarCart was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to user_bar_carts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_bar_cart
      @user_bar_cart = UserBarCart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_bar_cart_params
      params.require(:user_bar_cart).permit(:user_id, :spirit_brand_id, :quantity)
    end
end
