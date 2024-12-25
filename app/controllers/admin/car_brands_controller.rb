class Admin::CarBrandsController < AdminController
  before_action :set_car_brand, only: %i[ show edit update destroy ]
  def index
    car_brands = CarBrand.all.order(created_at: :desc)
    @q = car_brands.ransack(params[:q])
    @pagy, @car_brands = pagy(@q.result(distinct: true))
  end

  def show
  end

  def new
    @car_brand = CarBrand.new
  end

  def edit
  end

  def create
    @car_brand = CarBrand.new(car_brand_params)

    if @car_brand.save
      redirect_to admin_car_brand_path(@car_brand), notice: "Car brand successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Error when craeting car brand"
    end
  end

  def update
    if @car_brand.update(car_brand_params)
      redirect_to admin_car_brand_path(@car_brand), notice: "Car brand successfully updated."
    else
      render :edit, status: :unprocessable_entity, alert: "Error when updating car brand"
    end
  end

  def destroy
    @car_brand.destroy!

    redirect_to admin_car_brands_path, notice: "Car brand was seccessfully destroyed."
  end

  private
    def set_car_brand
      @car_brand = CarBrand.find(params.expect(:id))
    end

    def car_brand_params
      params.expect(car_brand: [ :name, :description ])
    end
end
