class Admin::CustomersController < AdminController
  before_action :set_customer, only: %i[ show destroy ]
  def index
    customers = Customer.all.order(created_at: :desc)
    @q = customers.ransack(params[:q])
    @pagy, @customers = pagy(@q.result(distinct: true))
  end

  def show
    orders = @customer.orders
    @q = orders.ransack(params[:q])
    @pagy, @orders = pagy(@q.result(distinct: true))
  end

  def destroy
    @customer.destroy!

    redirect_to admin_customers_path, notice: "Customer was seccessfully destroyed."
  end

  private
    def set_customer
      @customer = Customer.find(params.expect(:id))
    end
end
