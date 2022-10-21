class OrderItem < ApplicationRecord
  belongs_to :order
  has_one :order_item_fulfillment
end
