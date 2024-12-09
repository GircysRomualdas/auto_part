class SellersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @sellers = Seller.all
  end

  def destroy
    @seller = Seller.find(params[:id])

    if @seller.destroy
      flash[:notice] = "Seller was seccessfully deleted."
    else
      flash[:alert] = "Failed to delete the Seller"
    end

    redirect_to sellers_path
  end
end
