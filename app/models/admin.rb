class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  has_many :sellers, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "email", "created_at", "updated_at", "current_sign_in_at", "last_sign_in_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "sellers" ]
  end
end
