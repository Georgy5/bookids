# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_05_152628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.string "author"
    t.text "description"
    t.string "language"
    t.text "category"
    t.text "age"
    t.string "photo"
    t.integer "publishing_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.boolean "like", default: true
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_favorites_on_book_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "personalization_sku"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.text "content"
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "markup", default: "paragraph"
    t.index ["book_id"], name: "index_pages_on_book_id"
  end

  create_table "personalizations", force: :cascade do |t|
    t.string "character_name"
    t.integer "character_age"
    t.string "character_gender"
    t.bigint "book_id"
    t.bigint "user_id"
    t.string "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["book_id"], name: "index_personalizations_on_book_id"
    t.index ["user_id"], name: "index_personalizations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "header"
    t.text "description"
    t.integer "stars"
    t.bigint "personalization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personalization_id"], name: "index_reviews_on_personalization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "books"
  add_foreign_key "favorites", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "pages", "books"
  add_foreign_key "personalizations", "books"
  add_foreign_key "personalizations", "users"
  add_foreign_key "reviews", "personalizations"
end
