class Address < ApplicationRecord
  belongs_to :user

  validates :house_nr, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, uniqueness: true
end
