class CarPart < ApplicationRecord
  belongs_to :part_type
  belongs_to :car_model
  belongs_to :seller
end
