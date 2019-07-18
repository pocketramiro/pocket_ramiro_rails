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

ActiveRecord::Schema.define(version: 2019_07_18_012130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.integer "table_key"
    t.string "table_name"
    t.text "content"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.integer "inventory"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_parts", force: :cascade do |t|
    t.bigint "part_id"
    t.bigint "resource_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_id"], name: "index_resource_parts_on_part_id"
    t.index ["resource_id"], name: "index_resource_parts_on_resource_id"
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "category"
    t.string "company"
    t.bigint "contact_number"
    t.string "contact_name"
    t.text "manual_url"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.bigint "resource_type_id"
    t.string "name"
    t.float "cost"
    t.bigint "user_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type_id"], name: "index_resources_on_resource_type_id"
    t.index ["user_id"], name: "index_resources_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "table_key"
    t.string "table_name"
    t.bigint "user_id"
    t.text "notes"
    t.integer "priority"
    t.string "frequency_unit"
    t.integer "frequency_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.integer "status"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.bigint "phone_number"
    t.boolean "active", default: true
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notes", "users"
  add_foreign_key "resource_parts", "parts"
  add_foreign_key "resource_parts", "resources"
  add_foreign_key "resources", "resource_types"
  add_foreign_key "resources", "users"
  add_foreign_key "tickets", "users"
end
