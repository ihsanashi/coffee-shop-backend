class OrderItemFulfillment < ApplicationRecord
  belongs_to :order
  belongs_to :order_item
end
