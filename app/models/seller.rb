class Seller < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  belongs_to :admin

  has_many :car_parts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "email", "admin_id", "created_at", "updated_at", "current_sign_in_at", "last_sign_in_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "admin", "car_parts" ]
  end
end
