class Cart < ApplicationRecord
  belongs_to :customer
  has_many :cart_items, dependent: :destroy

  def total_price
    cart_items.sum { |item| item.total_price }
  end
end
