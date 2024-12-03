class CarPartController < ApplicationController
  def index
    @car_parts = CarPart.all
  end
end
