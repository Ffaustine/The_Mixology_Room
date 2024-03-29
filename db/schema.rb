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

ActiveRecord::Schema[7.0].define(version: 2023_08_07_145156) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktail_ingredients", force: :cascade do |t|
    t.bigint "cocktail_id", null: false
    t.bigint "ingredient_id", null: false
    t.float "amount"
    t.integer "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_cocktail_ingredients_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_cocktail_ingredients_on_ingredient_id"
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "IBA"
    t.string "glass"
    t.string "image_url"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "alcoholic"
  end

  create_table "favorite_cocktails", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cocktail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_favorite_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_favorite_cocktails_on_user_id"
  end

  create_table "favorites_cocktails", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cocktail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cocktail_id"], name: "index_favorites_cocktails_on_cocktail_id"
    t.index ["user_id"], name: "index_favorites_cocktails_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "ingredient_type"
    t.string "ABV"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cocktail_ingredients", "cocktails"
  add_foreign_key "cocktail_ingredients", "ingredients"
  add_foreign_key "favorite_cocktails", "cocktails"
  add_foreign_key "favorite_cocktails", "users"
  add_foreign_key "favorites_cocktails", "cocktails"
  add_foreign_key "favorites_cocktails", "users"
end
