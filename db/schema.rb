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

ActiveRecord::Schema[7.1].define(version: 2025_02_25_063607) do
  create_table "contracts", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "contract_no"
    t.text "description"
    t.date "contract_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manufacture_id", null: false
    t.index ["manufacture_id"], name: "index_contracts_on_manufacture_id"
  end

  create_table "manufactures", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.index ["contract_id"], name: "index_manufactures_on_contract_id"
  end

  create_table "paid_lists", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "contract_id", null: false
    t.decimal "amount", precision: 15, scale: 2, default: "0.0", null: false
    t.date "paid_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_paid_lists_on_contract_id"
  end

  create_table "payments", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "payment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "contract_id"
    t.string "product_name"
    t.bigint "status_id"
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2
    t.index ["contract_id"], name: "index_payments_on_contract_id"
    t.index ["status_id"], name: "index_payments_on_status_id"
  end

  create_table "statuses", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "status_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "payment_id", null: false
    t.string "source"
    t.decimal "amount", precision: 15, scale: 2
    t.decimal "exchange_rate", precision: 10
    t.bigint "vnd_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_transactions_on_payment_id"
  end

  add_foreign_key "contracts", "manufactures"
  add_foreign_key "paid_lists", "contracts"
  add_foreign_key "payments", "contracts"
  add_foreign_key "payments", "statuses"
  add_foreign_key "transactions", "payments"
end
