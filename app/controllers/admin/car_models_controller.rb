class Admin::CarModelsController < AdminController
  before_action :set_car_model, only: %i[ show edit update destroy ]
  def index
    car_models = CarModel.all.order(created_at: :desc)
    @q = car_models.ransack(params[:q])
    @pagy, @car_models = pagy(@q.result(distinct: true))
  end

  def show
  end

  def new
    @car_model = CarModel.new
  end

  def edit
  end

  def create
    @car_model = CarModel.new(car_model_params)

    if @car_model.save
      redirect_to admin_car_model_path(@car_model), notice: "Car model successfully created."
    else
      render :new, status: :unprocessable_entity, alert: "Error when craeting car model"
    end
  end

  def update
    if @car_model.update(car_model_params)
      redirect_to admin_car_model_path(@car_model), notice: "Car model successfully updated."
    else
      render :edit, status: :unprocessable_entity, alert: "Error when updating car model"
    end
  end

  def destroy
    @car_model.destroy!

    redirect_to admin_car_models_path, notice: "Car model was seccessfully destroyed."
  end

  private
    def set_car_model
      @car_model = CarModel.find(params.expect(:id))
    end

    def car_model_params
      params.expect(car_model: [ :name, :description ])
    end
end
