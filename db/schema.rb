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

ActiveRecord::Schema.define(version: 2019_05_06_084459) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_initial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_brands_categories_on_brand_id"
    t.index ["category_id"], name: "index_brands_categories_on_category_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
  end

  create_table "credits", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_id", null: false
    t.string "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "size"
    t.integer "condition", null: false
    t.integer "shipping_feeh", null: false
    t.integer "shipping_method", null: false
    t.integer "shipping_date", null: false
    t.integer "price", null: false
    t.bigint "seller_id", null: false
    t.integer "buyer_id"
    t.bigint "category_id", null: false
    t.bigint "brand_id"
    t.integer "likes_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_id", null: false
    t.integer "status", default: 1, null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["buyer_id"], name: "index_products_on_buyer_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["name"], name: "index_products_on_name"
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", default: "", null: false
    t.string "firstname_fullangle", null: false
    t.string "lastname_fullangle", null: false
    t.string "firstname_kana", null: false
    t.string "lastname_kana", null: false
    t.date "birthday", null: false
    t.integer "postal_cord", null: false
    t.string "city", null: false
    t.string "address_number", null: false
    t.string "building_name"
    t.string "phone_number"
    t.string "icon_image"
    t.text "profile"
    t.integer "prefecture_id", null: false
    t.string "password"
    t.string "uid"
    t.string "provider"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brands_categories", "brands"
  add_foreign_key "brands_categories", "categories"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "credits", "users"
  add_foreign_key "images", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users", column: "seller_id"
end
