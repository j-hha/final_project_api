class PurchaseCup < ApplicationRecord
  validates :user_id, presence: true
  validates :date, presence: true
  validates :price, presence: true
  has_one :consumption
end
