class Customer::CartsController < CustomerController
  def show
    @cart = current_customer.cart || current_customer.create_cart
    @order = Order.new()

    cart_items = @cart.cart_items.order(created_at: :desc)
    @q = cart_items.ransack(params[:q])

    @pagy, @cart_items = pagy(@q.result(distinct: true).includes(car_part: :part_type))

    @part_types = PartType.all
  end
end
