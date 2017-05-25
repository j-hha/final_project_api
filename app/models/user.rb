class User < ApplicationRecord
  has_many :consumptions
  has_many :purchase_cups
  has_many :purchase_pounds
end
