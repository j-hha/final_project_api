class Consumption < ApplicationRecord
  validates :user_id, presence: true
  validates :beverage_type, presence: true
  validates :date, presence: true
  belongs_to :user
end
