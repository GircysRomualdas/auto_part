class Admin::CarPartsController < AdminController
  before_action :set_car_part, only: %i[ show destroy ]
  def index
    @pagy, @car_parts = pagy(CarPart.all)
  end

  def show
  end

  def destroy
    @car_part.destroy!

    redirect_to admin_car_parts_path, notice: "Car part was seccessfully destroyed."
  end

  private
    def set_car_part
      @car_part = CarPart.find(params.expect(:id))
    end
end
