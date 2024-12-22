class CarPart < ApplicationRecord
  belongs_to :part_type
  belongs_to :seller

  has_many :stocks
  has_many :order_items
  has_many :cart_items

  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [ 38, 38 ]
    attachable.variant :medium, resize_to_limit: [ 200, 200 ]
    attachable.variant :large, resize_to_limit: [ 500, 500 ]
  end

  validates :price, numericality: { greater_than: 0, message: "must be a positive number" }

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "price", "active", "part_type_id", "seller_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "part_type", "seller" ]
  end
end
