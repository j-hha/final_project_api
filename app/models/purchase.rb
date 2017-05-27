class Purchase < ApplicationRecord
  validates :date, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
  has_many :servings
end
