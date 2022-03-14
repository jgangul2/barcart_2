class UserBarCartsController < ApplicationController
  before_action :set_user_bar_cart, only: [:show, :edit, :update, :destroy]

  # GET /user_bar_carts
  def index
    @user_bar_carts = UserBarCart.all
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
      redirect_to @user_bar_cart, notice: 'User bar cart was successfully created.'
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
    redirect_to user_bar_carts_url, notice: 'User bar cart was successfully destroyed.'
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