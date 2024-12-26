class CarPart < ApplicationRecord
  belongs_to :part_type
  belongs_to :seller
  belongs_to :car_model

  has_one :stock, dependent: :destroy

  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :price, numericality: { greater_than: 0, message: "must be a positive number" }

  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [ 38, 38 ]
    attachable.variant :medium, resize_to_limit: [ 200, 200 ]
    attachable.variant :large, resize_to_limit: [ 500, 500 ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "name", "description", "price", "active", "part_type_id", "seller_id", "car_model_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "part_type", "seller", "car_model", "stock", "order_items", "cart_items" ]
  end
end
