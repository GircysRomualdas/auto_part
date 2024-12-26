class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :car_part

  enum :status, { pending: "pending", sent: "sent", canceled: "canceled" }

  after_save :update_order_status

  def total_price
    price * quantity
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "price", "quantity", "status", "order_id", "car_part_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_part", "order" ]
  end

  private
    def update_order_status
      order.update_status_from_items
    end
end
