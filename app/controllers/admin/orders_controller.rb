class Admin::OrdersController < AdminController
  def index
    orders = Order.all.order(created_at: :desc)
    @q = orders.ransack(params[:q])
    @pagy, @orders = pagy(@q.result(distinct: true))
  end

  def show
    @order = Order.find(params[:id])

    order_items = @order.order_items.order(created_at: :desc)
    @q = order_items.ransack(params[:q])

    @pagy, @order_items = pagy(@q.result(distinct: true).includes(car_part: :part_type))

    @part_types = PartType.all
  end
end
