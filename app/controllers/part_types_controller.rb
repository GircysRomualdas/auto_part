class PartTypesController < ApplicationController
  def show
    @part_type = PartType.find(params[:id])
    @pagy, @car_parts = pagy(@part_type.car_parts)
  end
end
