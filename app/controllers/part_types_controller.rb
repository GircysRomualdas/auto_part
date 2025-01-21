class PartTypesController < ApplicationController
  def show
    @part_type = PartType.find(params[:id])
    part_types = @part_type.car_parts
                          .where(active: true)
                          .includes(car_model: :car_brand)
                          .order(created_at: :desc)
    @q = part_types.ransack(params[:q])
    @pagy, @car_parts = pagy(@q.result(distinct: true))

    @car_brands = CarBrand.all
    @car_models = []
  end
end
