class CreateOrderPaymentLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :order_payment_logs do |t|
      t.references :order, null: false, foreign_key: true
      t.references :order_payment, null: false, foreign_key: true
      t.string :response_code
      t.string :response_message

      t.timestamps
    end
  end
end
