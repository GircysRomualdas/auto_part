class Customer::OrdersController < CustomerController
  def index
    orders = current_customer.orders.order(created_at: :desc)
    @q = orders.ransack(params[:q])
    @pagy, @orders = pagy(@q.result(distinct: true))
  end

  def show
  end
end
