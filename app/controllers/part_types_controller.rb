class PartTypesController < ApplicationController
  def show
    @part_type = PartType.find(params[:id])
    part_types = @part_type.car_parts.where(active: true)
    @q = part_types.ransack(params[:q])
    @pagy, @car_parts = pagy(@q.result(distinct: true))
  end
end
