class CreateVariantImages < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_images do |t|
      t.references :variant_option, null: false, foreign_key: true
      t.text :url
      t.string :alt_text

      t.timestamps
    end
  end
end
