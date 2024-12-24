class OrderService
  def self.create_order_from_cart(customer, shipping_address)
    cart = customer.cart
    return { success: false, error: "Cart is empty" } if cart.cart_items.empty?

    ActiveRecord::Base.transaction do
      cart.cart_items.each do |cart_item|
        stock = cart_item.car_part.stock
        if stock.quantity < cart_item.quantity
          raise ActiveRecord::Rollback, "Insufficient stock for #{cart_item.car_part.name}"
        end
      end

      order = Order.create!(
        customer: customer,
        address: shipping_address,
        status: "pending"
      )

      cart.cart_items.each do |cart_item|
        stock = cart_item.car_part.stock
        stock.update!(quantity: stock.quantity - cart_item.quantity)

        OrderItem.create!(
          order: order,
          car_part: cart_item.car_part,
          quantity: cart_item.quantity,
          price: cart_item.car_part.price,
          status: "pending"
        )
      end

      cart.cart_items.destroy_all

      { success: true, order: order }
    rescue ActiveRecord::Rollback => e
      { success: false, error: e.message }
    end
  end
end
