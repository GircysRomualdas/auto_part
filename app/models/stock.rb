class Stock < ApplicationRecord
  belongs_to :car_part

  def self.ransackable_attributes(auth_object = nil)
    [ "quantity" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_part" ]
  end
end
