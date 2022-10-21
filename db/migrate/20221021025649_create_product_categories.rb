class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.references :product, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end