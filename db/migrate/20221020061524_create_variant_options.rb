class CreateVariantOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_options do |t|
      t.references :product_variant, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.decimal :price_difference
      t.integer :added_by
      t.boolean :is_available

      t.timestamps
    end
  end
end
