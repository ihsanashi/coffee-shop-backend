class ProductVariant < ApplicationRecord
  belongs_to :product
  has_many :variant_options
end
