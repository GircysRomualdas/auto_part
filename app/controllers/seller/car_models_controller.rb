class Seller::CarModelsController < SellerController
  def by_brand
    car_models = CarModel.where(car_brand_id: params[:car_brand_id])
    render json: car_models
  end
end
