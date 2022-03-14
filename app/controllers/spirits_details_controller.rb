class SpiritsDetailsController < ApplicationController
  before_action :set_spirits_detail, only: %i[show edit update destroy]

  def index
    @q = SpiritsDetail.ransack(params[:q])
    @spirits_details = @q.result(distinct: true).includes(
      :cocktail_recipes_standards, :spirits_brands
    ).page(params[:page]).per(10)
  end

  def show
    @spirits_brand = SpiritsBrand.new
    @cocktail_recipes_standard = CocktailRecipesStandard.new
  end

  def new
    @spirits_detail = SpiritsDetail.new
  end

  def edit; end

  def create
    @spirits_detail = SpiritsDetail.new(spirits_detail_params)

    if @spirits_detail.save
      redirect_to @spirits_detail,
                  notice: "Spirits detail was successfully created."
    else
      render :new
    end
  end

  def update
    if @spirits_detail.update(spirits_detail_params)
      redirect_to @spirits_detail,
                  notice: "Spirits detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @spirits_detail.destroy
    redirect_to spirits_details_url,
                notice: "Spirits detail was successfully destroyed."
  end

  private

  def set_spirits_detail
    @spirits_detail = SpiritsDetail.find(params[:id])
  end

  def spirits_detail_params
    params.require(:spirits_detail).permit(:name)
  end
end
