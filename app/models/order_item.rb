class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :car_part
end
