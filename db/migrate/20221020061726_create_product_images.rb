class CreateProductImages < ActiveRecord::Migration[7.0]
  def change
    create_table :product_images do |t|
      t.references :product, null: false, foreign_key: true
      t.text :url
      t.string :alt_text

      t.timestamps
    end
  end
end
