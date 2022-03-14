class UserCustomizedCocktailsController < ApplicationController
  before_action :set_user_customized_cocktail,
                only: %i[show edit update destroy]

  def index
    @q = UserCustomizedCocktail.ransack(params[:q])
    @user_customized_cocktails = @q.result(distinct: true).includes(:user,
                                                                    :cocktail, :ingredient).page(params[:page]).per(10)
  end

  def show; end

  def new
    @user_customized_cocktail = UserCustomizedCocktail.new
  end

  def edit; end

  def create
    @user_customized_cocktail = UserCustomizedCocktail.new(user_customized_cocktail_params)

    if @user_customized_cocktail.save
      message = "UserCustomizedCocktail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @user_customized_cocktail, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @user_customized_cocktail.update(user_customized_cocktail_params)
      redirect_to @user_customized_cocktail,
                  notice: "User customized cocktail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user_customized_cocktail.destroy
    message = "UserCustomizedCocktail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to user_customized_cocktails_url, notice: message
    end
  end

  private

  def set_user_customized_cocktail
    @user_customized_cocktail = UserCustomizedCocktail.find(params[:id])
  end

  def user_customized_cocktail_params
    params.require(:user_customized_cocktail).permit(:user_id, :cocktail_id,
                                                     :ingredient_id)
  end
end
