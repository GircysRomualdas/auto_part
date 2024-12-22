class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
  has_many :sellers, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [ "email" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
