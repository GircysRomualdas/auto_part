class CarPartsController < ApplicationController
  def index
    car_parts = CarPart.where(active: true).order(created_at: :desc)
    @q = car_parts.ransack(params[:q])
    @pagy, @car_parts = pagy(@q.result(distinct: true).includes(:part_type))

    @part_types = PartType.all

    @car_brands = CarBrand.all
    @car_models = []
  end
  def show
    @car_part = CarPart.find(params[:id])
  end
end
