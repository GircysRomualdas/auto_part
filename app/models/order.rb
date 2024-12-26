class Order < ApplicationRecord
  belongs_to :customer

  has_many :order_items, dependent: :destroy

  has_one :shipping_detail, dependent: :destroy

  enum :status, { pending: "pending", partially_sent: "partially_sent", fully_sent: "fully_sent", canceled: "canceled" }

  def total_price
    order_items.sum { |item| item.total_price }
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "status", "customer_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "customer", "order_items", "shipping_detail" ]
  end

  def update_status_from_items
    if order_items.all? { |item| item.status == "sent" }
      update(status: "fully_sent")
    elsif order_items.any? { |item| item.status == "sent" }
      update(status: "partially_sent")
    elsif order_items.all? { |item| item.status == "canceled" }
      update(status: "canceled")
    else
      update(status: "pending")
    end
  end
end
