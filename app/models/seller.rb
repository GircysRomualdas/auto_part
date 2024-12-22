class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
  belongs_to :admin
  has_many :car_parts, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "email", "created_at", "admin_id", "updated_at", "current_sign_in_at", "last_sign_in_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "admin" ]
  end
end
