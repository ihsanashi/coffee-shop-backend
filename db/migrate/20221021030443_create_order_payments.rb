class CreateOrderPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :order_payments do |t|
      t.references :order, null: false, foreign_key: true
      t.string :payment_gateway
      t.string :payment_status

      t.timestamps
    end
  end
end
