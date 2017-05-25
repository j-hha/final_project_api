class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
  has_many :consumptions
  has_many :purchase_cups
  has_many :purchase_pounds
end
