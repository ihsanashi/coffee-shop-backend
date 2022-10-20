class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :added_by

      t.timestamps
    end
  end
end
