class CarPart < ApplicationRecord
  belongs_to :car_model
  belongs_to :part_type
  belongs_to :seller

  has_many :order_items
end
