class CarBrand < ApplicationRecord
  has_many :car_models, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "description", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_models" ]
  end
end
