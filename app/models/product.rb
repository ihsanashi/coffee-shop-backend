class Product < ApplicationRecord
  has_many :product_images
  has_many :product_variants
  has_many :product_tags

  validates :slug, uniqueness: true

  before_create :slugify
  before_update :slugify, if: :will_save_change_to_title

  def slugify
    self.slug = title.parameterize
  end
end
