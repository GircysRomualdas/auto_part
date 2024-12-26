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

  def new
    if current_customer.cart.cart_items.empty?
      redirect_to customer_cart_path(current_customer.cart || current_customer.create_cart), alert: "Your cart is empty. Please add items before placing an order."
      nil
    end
  end

  def create
    if current_customer.cart.cart_items.empty?
      redirect_to customer_cart_path(current_customer.cart || current_customer.create_cart), alert: "Your cart is empty. Please add items before placing an order."
      nil
    end

    line_items = []
    current_customer.cart.cart_items.each do |item|
      line_items << {
        quantity: item.quantity,
        price_data: {
          currency: "eur",
          product_data: {
            name: item.car_part.name
          },
          unit_amount: (item.total_price * 100).to_i
        }
      }
    end

    session = Stripe::Checkout::Session.create({
      ui_mode: "embedded",
      shipping_address_collection: { allowed_countries: [ "LT" ] },
      phone_number_collection: { enabled: true },
      line_items: line_items,
      mode: "payment",
      return_url: "#{success_customer_orders_url}?session_id={CHECKOUT_SESSION_ID}"
    })

    render json: { clientSecret: session.client_secret }
  end

  def success
    flash[:notice] ||= []
    flash[:notice] << "Order payment successfull"

    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    customer_details = session.customer_details

    result = OrderService.create_order_from_cart(current_customer, customer_details)

    if result[:success]
      flash[:notice] << "Order placed successfully!"

      redirect_to customer_orders_path
    else
      redirect_to customer_cart_path(current_customer.cart || current_customer.create_cart), status: :unprocessable_entity, alert: result[:error]
    end
  end
end
