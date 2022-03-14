class UserCustomizedCocktailsController < ApplicationController
  before_action :set_user_customized_cocktail, only: [:show, :edit, :update, :destroy]

  # GET /user_customized_cocktails
  def index
    @user_customized_cocktails = UserCustomizedCocktail.all
  end

  # GET /user_customized_cocktails/1
  def show
  end

  # GET /user_customized_cocktails/new
  def new
    @user_customized_cocktail = UserCustomizedCocktail.new
  end

  # GET /user_customized_cocktails/1/edit
  def edit
  end

  # POST /user_customized_cocktails
  def create
    @user_customized_cocktail = UserCustomizedCocktail.new(user_customized_cocktail_params)

    if @user_customized_cocktail.save
      redirect_to @user_customized_cocktail, notice: 'User customized cocktail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /user_customized_cocktails/1
  def update
    if @user_customized_cocktail.update(user_customized_cocktail_params)
      redirect_to @user_customized_cocktail, notice: 'User customized cocktail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /user_customized_cocktails/1
  def destroy
    @user_customized_cocktail.destroy
    redirect_to user_customized_cocktails_url, notice: 'User customized cocktail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_customized_cocktail
      @user_customized_cocktail = UserCustomizedCocktail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_customized_cocktail_params
      params.require(:user_customized_cocktail).permit(:user_id, :cocktail_id, :ingredient_id)
    end
end
