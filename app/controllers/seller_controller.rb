class SellerController < ApplicationController
  before_action :authenticate_seller!

  def index
    car_parts = current_seller.car_parts

    @order_items = OrderItem.where(car_part_id: car_parts.pluck(:id), status: "pending").order(created_at: :desc).take(5)

    @stats = {
      sales_today: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.midnight..Time.now).count,
      revenue_today: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.midnight..Time.now).sum("price * quantity").round,
      avg_sale_today: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.midnight..Time.now).average("price * quantity")&.round || 0,
      total_quantity_sold_today: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.midnight..Time.now).sum("quantity"),

      sales_this_week: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.beginning_of_week..Time.now).count,
      revenue_this_week: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.beginning_of_week..Time.now).sum("price * quantity").round,
      avg_sale_this_week: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.beginning_of_week..Time.now).average("price * quantity")&.round || 0,
      total_quantity_sold_this_week: OrderItem.where(car_part_id: car_parts.pluck(:id), created_at: Time.now.beginning_of_week..Time.now).sum("quantity")
    }
  end


  def show
    @seller = current_seller
  end
end
