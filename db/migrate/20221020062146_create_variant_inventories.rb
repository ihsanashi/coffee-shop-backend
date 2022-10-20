class CreateVariantInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_inventories do |t|
      t.references :variant_option, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
