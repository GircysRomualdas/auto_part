class Stock < ApplicationRecord
  belongs_to :car_part

  def self.ransackable_attributes(auth_object = nil)
    [ "quantity", "car_part_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_part" ]
  end
end
