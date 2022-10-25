class DropProductCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_categories
    drop_table :product_notes
  end
end
