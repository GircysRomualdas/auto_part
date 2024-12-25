class Cart < ApplicationRecord
  belongs_to :customer

  has_many :cart_items, dependent: :destroy

  def total_price
    cart_items.sum { |item| item.total_price }
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "customer", "cart_items" ]
  end
end
