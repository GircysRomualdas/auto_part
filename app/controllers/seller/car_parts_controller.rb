class Seller::CarPartsController < SellerController
  before_action :set_car_part, only: %i[show edit update destroy]
  before_action :set_part_types, only: %i[index new edit create update ]
  before_action :authorize_seller!, only: %i[show edit update destroy]

  def index
    car_parts = CarPart.where(seller: current_seller).order(created_at: :desc)
    @q = car_parts.ransack(params[:q])
    @pagy, @car_parts = pagy(@q.result(distinct: true).includes(:part_type))
  end

  def show
  end

  def new
    @car_part = CarPart.new
    @car_brands = CarBrand.all
    @car_models = []
  end

  def edit
    @car_brands = CarBrand.all
    @car_models = CarModel.where(car_brand_id: @car_part.car_model.car_brand.id)
  end

  def create
    @car_part = current_seller.car_parts.new(car_part_params)

    if @car_part.save
      redirect_to seller_car_part_path(@car_part), notice: "Car part successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Error when creating car part."
    end
  end

  def update
    if @car_part.update(car_part_params)
      redirect_to seller_car_part_path(@car_part), notice: "Car part successfully updated."
    else
      render :edit, status: :unprocessable_entity, alert: "Error when updating car part."
    end
  end

  def destroy
    @car_part.destroy!
    redirect_to seller_car_parts_path, notice: "Car part was successfully destroyed."
  end

  private

    def authorize_seller!
      unless @car_part.seller == current_seller
        redirect_to seller_car_parts_path, alert: "You are not authorized to perform this action."
      end
    end

    def set_car_part
      @car_part = CarPart.find(params.expect(:id))
    end

    def set_part_types
      @part_types = PartType.all
    end

    def car_part_params
      params.require(:car_part).permit(:name, :description, :price, :part_type_id, :active, :image, :car_model_id)
    end
end
