class Product < ApplicationRecord
  has_many :product_images
  has_many :product_variants
  has_many :product_tags
  has_one :product_category
  has_one :product_note
  has_one :product_tax
end
