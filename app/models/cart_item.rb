class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :car_part

  validates :quantity, numericality: { greater_than: 0, message: "must be a positive number" }
  validate :quantity_does_not_exceed_stock

  def total_price
    car_part.price * quantity
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "quantity", "created_at", "cart_id", "car_part_id", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_part", "cart" ]
  end

  private
    def quantity_does_not_exceed_stock
      stock = car_part.stock&.quantity || 0
      if quantity > stock
        errors.add(:quantity, "cannot exceed available stock of #{stock}")
      end
    end
end
