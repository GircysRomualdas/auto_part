class CarPartsController < ApplicationController
  def index
    car_parts = CarPart.where(active: true)
    @q = car_parts.ransack(params[:q])
    @pagy, @car_parts = pagy(@q.result(distinct: true).includes(:part_type))

    @part_types = PartType.all
  end
  def show
    @car_part = CarPart.find(params[:id])
  end
end
