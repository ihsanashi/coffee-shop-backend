# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_25_053455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_discounts", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "code"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_discounts_on_order_id"
  end

  create_table "order_item_fulfillments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "order_item_id", null: false
    t.boolean "is_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_item_fulfillments_on_order_id"
    t.index ["order_item_id"], name: "index_order_item_fulfillments_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "title"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_payment_logs", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "order_payment_id", null: false
    t.string "response_code"
    t.string "response_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_payment_logs_on_order_id"
    t.index ["order_payment_id"], name: "index_order_payment_logs_on_order_payment_id"
  end

  create_table "order_payments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "payment_gateway"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_payments_on_order_id"
  end

  create_table "order_sessions", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "table_number"
    t.boolean "is_occupied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_sessions_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "number"
    t.bigint "user_id", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_categories_on_product_id"
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.text "url"
    t.string "alt_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_notes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_notes_on_product_id"
  end

  create_table "product_tags", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_tags_on_product_id"
  end

  create_table "product_taxes", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_taxes_on_product_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "title"
    t.text "description"
    t.integer "added_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "sku"
    t.decimal "base_price"
    t.integer "added_by"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "category"
    t.string "note"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "variant_images", force: :cascade do |t|
    t.bigint "variant_option_id", null: false
    t.text "url"
    t.string "alt_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variant_option_id"], name: "index_variant_images_on_variant_option_id"
  end

  create_table "variant_inventories", force: :cascade do |t|
    t.bigint "variant_option_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variant_option_id"], name: "index_variant_inventories_on_variant_option_id"
  end

  create_table "variant_options", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.string "title"
    t.text "description"
    t.decimal "price_difference"
    t.integer "added_by"
    t.boolean "is_available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_variant_id"], name: "index_variant_options_on_product_variant_id"
  end

  add_foreign_key "order_discounts", "orders"
  add_foreign_key "order_item_fulfillments", "order_items"
  add_foreign_key "order_item_fulfillments", "orders"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_payment_logs", "order_payments"
  add_foreign_key "order_payment_logs", "orders"
  add_foreign_key "order_payments", "orders"
  add_foreign_key "order_sessions", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_notes", "products"
  add_foreign_key "product_tags", "products"
  add_foreign_key "product_taxes", "products"
  add_foreign_key "product_variants", "products"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "roles"
  add_foreign_key "variant_images", "variant_options"
  add_foreign_key "variant_inventories", "variant_options"
  add_foreign_key "variant_options", "product_variants"
end
