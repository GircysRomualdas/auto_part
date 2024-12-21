class CarPart < ApplicationRecord
  belongs_to :part_type
  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [ 38, 38 ]
    attachable.variant :medium, resize_to_limit: [ 200, 200 ]
    attachable.variant :large, resize_to_limit: [ 500, 500 ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "price", "active", "part_type_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "part_type" ]
  end
end
