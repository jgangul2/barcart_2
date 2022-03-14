class Api::V1::SpiritsDetailsController < Api::V1::GraphitiController
  def index
    spirits_details = SpiritsDetailResource.all(params)
    respond_with(spirits_details)
  end

  def show
    spirits_detail = SpiritsDetailResource.find(params)
    respond_with(spirits_detail)
  end

  def create
    spirits_detail = SpiritsDetailResource.build(params)

    if spirits_detail.save
      render jsonapi: spirits_detail, status: :created
    else
      render jsonapi_errors: spirits_detail
    end
  end

  def update
    spirits_detail = SpiritsDetailResource.find(params)

    if spirits_detail.update_attributes
      render jsonapi: spirits_detail
    else
      render jsonapi_errors: spirits_detail
    end
  end

  def destroy
    spirits_detail = SpiritsDetailResource.find(params)

    if spirits_detail.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: spirits_detail
    end
  end
end
