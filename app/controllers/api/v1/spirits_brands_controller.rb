class Api::V1::SpiritsBrandsController < Api::V1::GraphitiController
  def index
    spirits_brands = SpiritsBrandResource.all(params)
    respond_with(spirits_brands)
  end

  def show
    spirits_brand = SpiritsBrandResource.find(params)
    respond_with(spirits_brand)
  end

  def create
    spirits_brand = SpiritsBrandResource.build(params)

    if spirits_brand.save
      render jsonapi: spirits_brand, status: 201
    else
      render jsonapi_errors: spirits_brand
    end
  end

  def update
    spirits_brand = SpiritsBrandResource.find(params)

    if spirits_brand.update_attributes
      render jsonapi: spirits_brand
    else
      render jsonapi_errors: spirits_brand
    end
  end

  def destroy
    spirits_brand = SpiritsBrandResource.find(params)

    if spirits_brand.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: spirits_brand
    end
  end
end
