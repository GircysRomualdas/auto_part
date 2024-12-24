class Customer::OrdersController < CustomerController
  def index
    orders = current_customer.orders.order(created_at: :desc)
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

  def create
    if current_customer.cart.cart_items.empty?
      redirect_to customer_carts_path, alert: "Your cart is empty. Please add items before placing an order."
      return
    end

    customer = current_customer

    shipping_address = params[:order][:address]
    if shipping_address.present?
      redirect_to customer_carts_path, alert: "Your cart is empty. Please add items before placing an order."
      return
    end

    result = OrderService.create_order_from_cart(customer, shipping_address)

    if result[:success]
      redirect_to customer_orders_path, notice: "Order placed successfully!"
    else
      redirect_to customer_carts_path, status: :unprocessable_entity, alert: result[:error]
    end
  end
end
