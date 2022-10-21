class CreateOrderSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_sessions do |t|
      t.references :order, null: false, foreign_key: true
      t.string :table_number
      t.boolean :is_occupied

      t.timestamps
    end
  end
end
