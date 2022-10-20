class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :sku
      t.decimal :base_price
      t.integer :added_by
      t.boolean :is_available

      t.timestamps
    end
  end
end
