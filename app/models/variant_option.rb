class VariantOption < ApplicationRecord
  belongs_to :product_variant
  has_many :variant_images
  has_one :variant_inventory
end
