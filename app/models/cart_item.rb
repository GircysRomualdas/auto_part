class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :car_part

  validates :quantity, numericality: { greater_than: 0, message: "must be a positive number" }

  def total_price
    car_part.price * quantity
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "quantity", "total_price" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_part" ]
  end
end
