class OrderPaymentLog < ApplicationRecord
  belongs_to :order
  belongs_to :order_payment
end
