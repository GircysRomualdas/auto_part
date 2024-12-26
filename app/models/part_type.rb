class PartType < ApplicationRecord
  has_many :car_parts, dependent: :destroy

  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [ 38, 38 ]
    attachable.variant :medium, resize_to_limit: [ 200, 200 ]
    attachable.variant :large, resize_to_limit: [ 500, 500 ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "description", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "car_parts" ]
  end
end
