class Seller::StocksController < SellerController
  def create
    @car_part = CarPart.find(params[:car_part_id])
    @stock = @car_part.build_stock(car_part: @car_part, quantity: 0)

    if @stock.save
      redirect_back(fallback_location: root_path, notice: "Stock created.")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to create stock.")
    end
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(stock_params)
      redirect_back(fallback_location: root_path, notice: "Stock updated.")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to update stock.")
    end
  end

  def destroy
    @stock = Stock.find(params.expect(:id))
    @stock.destroy!

    redirect_back(fallback_location: root_path, alert: "Stock was successfully destroyed.")
  end

  private
    def stock_params
      params.require(:stock).permit(:quantity)
    end
end
