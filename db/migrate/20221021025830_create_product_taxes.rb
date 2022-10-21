class CreateProductTaxes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_taxes do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :rate

      t.timestamps
    end
  end
end
