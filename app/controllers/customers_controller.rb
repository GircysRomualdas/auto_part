class CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def destroy
    @customer = Customer.find(params[:id])

    if @customer.destroy
      flash[:notice] = "Customer was seccessfully deleted."
    else
      flash[:alert] = "Failed to delete the customer"
    end

    redirect_to customers_path
  end
end
