class CarModel < ApplicationRecord
  belongs_to :car_brand

  has_many :car_parts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "description", "car_brand_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_brand", "car_parts" ]
  end
end
