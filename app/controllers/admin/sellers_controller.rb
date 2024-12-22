class Admin::SellersController < AdminController
  before_action :set_seller, only: %i[ show destroy ]
  def index
    sellers = Seller.all
    @q = sellers.ransack(params[:q])
    @pagy, @sellers = pagy(@q.result(distinct: true).includes(:admin))
  end

  def show
    car_parts = @seller.car_parts
    @q = car_parts.ransack(params[:q])
    @pagy, @car_parts = pagy(@q.result(distinct: true).includes(:part_type))

    @part_types = PartType.all
  end

  def new
    @seller = Seller.new
  end

  def create
    admin = Admin.find(current_admin.id)
    @seller = admin.sellers.new(seller_params)

    if @seller.save
      redirect_to admin_seller_path(@seller), notice: "Seller successfully created."
    else
      render :new, alert: "Error when craeting seller"
    end
  end

  def destroy
    @seller.destroy!

    redirect_to admin_sellers_path, notice: "Seller was seccessfully destroyed."
  end

  private
    def set_seller
      @seller = Seller.find(params.expect(:id))
    end

    def seller_params
      params.expect(seller: [ :email, :password ])
    end
end
