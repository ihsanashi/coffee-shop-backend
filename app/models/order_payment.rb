class OrderPayment < ApplicationRecord
  belongs_to :order
  has_many :order_payment_logs
end
