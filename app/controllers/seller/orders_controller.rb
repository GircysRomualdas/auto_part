class Seller::OrdersController < SellerController
  def index
    car_parts = current_seller.car_parts
    order_items = OrderItem.where(car_part_id: car_parts.pluck(:id))
    @q = order_items.ransack(params[:q])
    @pagy, @order_items = pagy(@q.result(distinct: true).includes(:order).includes(:car_part))
  end

  def show
    @order_item = OrderItem.find(params.expect(:id))
  end

  def update
    @order_item = OrderItem.find(params[:id])

    if @order_item.update(order_item_params)
      redirect_back(fallback_location: root_path, notice: "Order item updated.")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to update order item.")
    end
  end

  private
    def order_item_params
      params.require(:order_item).permit(:status)
    end
end
