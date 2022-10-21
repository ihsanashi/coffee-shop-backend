class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :order_payments
  has_one :order_discount
  has_one :order_session
end
