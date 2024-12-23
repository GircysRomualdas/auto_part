class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "status", "address", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
