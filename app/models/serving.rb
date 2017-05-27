class Serving < ApplicationRecord
  validates :user_id, presence: true
  validates :purchase_id, presence: true
  validates :date, presence: true
  validates :beverage_type, presence: true
  validates :size, presence: true
  belongs_to :purchase
  belongs_to :user
end
