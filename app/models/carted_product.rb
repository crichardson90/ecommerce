class CartedProduct < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true
  belongs_to :user

  validates :amount, numericality: {greater_than: 0, only_integer: true}
end
