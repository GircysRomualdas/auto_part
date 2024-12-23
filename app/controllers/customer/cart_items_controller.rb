class Customer::CartItemsController < CustomerController
  before_action :set_cart, only: %i[ create update destroy ]

  def create
    car_part = CarPart.find(params[:car_part_id])

    cart_item = @cart.cart_items.find_by(car_part: car_part)
    if cart_item
      cart_item.increment!(:quantity)
    else
      @cart.cart_items.create(car_part: car_part, quantity: 1)
    end

    redirect_back(fallback_location: root_path, notice: "Item added to cart.")
  end

  def update
    cart_item = @cart.cart_items.find(params[:id])
    if cart_item.update(cart_item_params)
      redirect_back(fallback_location: root_path, notice: "Cart item updated.")
    else
      redirect_back(fallback_location: root_path, alert: "Failed to update cart item.")
    end
  end

  def destroy
    cart_item = @cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_back(fallback_location: root_path, notice: "Cart item  was successfully destroyed.")
  end

  private
    def set_cart
      @cart = current_customer.cart || current_customer.create_cart
    end

    def cart_item_params
      params.require(:cart_item).permit(:quantity)
    end
end
