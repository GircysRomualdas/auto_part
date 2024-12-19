class Admin::CustomersController < AdminController
  before_action :set_customer, only: %i[ show destroy ]
  def index
    customers = Customer.all
    @q = customers.ransack(params[:q])
    @pagy, @customers = pagy(@q.result(distinct: true))
  end

  def show
  end

  def destroy
    @customer.destroy!

    redirect_to admin_customers_path, notice: "customer was seccessfully destroyed."
  end

  private
    def set_customer
      @customer = Customer.find(params.expect(:id))
    end
end
