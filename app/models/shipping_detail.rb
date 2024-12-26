class ShippingDetail < ApplicationRecord
  belongs_to :order

  def self.ransackable_attributes(auth_object = nil)
    [ "recipient_name", "recipient_email", "address_line_1", "address_line_2", "city", "state", "postal_code", "country", "phone_number", "order_id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "order" ]
  end
end
