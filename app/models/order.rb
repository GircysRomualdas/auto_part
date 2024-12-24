class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  def total_price
    order_items.sum { |item| item.total_price }
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "status", "address", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
