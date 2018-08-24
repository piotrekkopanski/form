class User < ApplicationRecord
  has_one :address, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :address }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  accepts_nested_attributes_for :address, allow_destroy: true
end
