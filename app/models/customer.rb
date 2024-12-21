class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  def self.ransackable_attributes(auth_object = nil)
    [ "email", "created_at", "updated_at", "current_sign_in_at", "last_sign_in_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
