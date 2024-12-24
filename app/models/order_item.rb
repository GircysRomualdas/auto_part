class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :car_part

  def total_price
    price * quantity
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "price", "quantity", "address" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_part" ]
  end
end
