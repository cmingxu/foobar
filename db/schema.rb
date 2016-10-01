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

ActiveRecord::Schema.define(version: 20161001045753) do

  create_table "accessories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "count"
    t.integer  "category_id"
    t.string   "category_name"
    t.integer  "user_id"
    t.string   "state"
    t.text     "description",   limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "price"
    t.string   "quanlity"
  end

  create_table "accessory_condition_values", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "accessory_id"
    t.integer  "condition_id"
    t.integer  "condition_value_id"
    t.string   "condition_name"
    t.string   "condition_value_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "accessory_conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "accessory_id"
    t.integer  "condition_id"
    t.integer  "condition_value_id"
    t.string   "condition_value_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "pinyin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_categories_on_deleted_at", using: :btree
  end

  create_table "condition_values", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "condition_id"
    t.string   "pinyin"
    t.integer  "position"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "conditions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "category_id"
    t.string   "pinyin"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "image_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "simple_captcha_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "idx_key", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "roles"
    t.boolean  "visible",                default: true
    t.string   "auth_token"
    t.string   "name"
    t.string   "mobile"
    t.datetime "deleted_at"
    t.string   "province"
    t.string   "province_code"
    t.string   "city"
    t.string   "city_code"
    t.string   "region"
    t.string   "region_code"
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
