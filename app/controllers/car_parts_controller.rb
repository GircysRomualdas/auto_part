class CarPartsController < ApplicationController
  def show
    @car_part = CarPart.find(params[:id])
  end
end
