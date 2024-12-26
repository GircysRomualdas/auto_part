class OrderService
  def self.create_order_from_cart(customer, customer_details)
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
        status: "pending"
      )

      ShippingDetail.create!(
        order: order,
        recipient_name: customer_details.name,
        recipient_email: customer_details.email,
        address_line_1: customer_details.address.line1,
        address_line_2: customer_details.address.line2,
        city: customer_details.address.city,
        state: customer_details.address.state,
        postal_code: customer_details.address.postal_code,
        country: customer_details.address.country,
        phone_number: customer_details.phone
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
