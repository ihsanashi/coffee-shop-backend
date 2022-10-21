class CreateOrderItemFulfillments < ActiveRecord::Migration[7.0]
  def change
    create_table :order_item_fulfillments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :order_item, null: false, foreign_key: true
      t.boolean :is_completed

      t.timestamps
    end
  end
end
