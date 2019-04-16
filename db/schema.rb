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

ActiveRecord::Schema.define(version: 2019_04_16_165123) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeowners", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "street_name"
    t.text "city"
    t.text "state"
    t.integer "zipcode"
    t.text "email"
    t.integer "postings_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["postings_id"], name: "index_homeowners_on_postings_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "before_image_url"
    t.string "after_image_url"
    t.text "start_date"
    t.text "finish_date"
    t.integer "services_id"
    t.integer "service_providers_id"
    t.integer "reviews_id"
    t.integer "homeowners_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["homeowners_id"], name: "index_postings_on_homeowners_id"
    t.index ["reviews_id"], name: "index_postings_on_reviews_id"
    t.index ["service_providers_id"], name: "index_postings_on_service_providers_id"
    t.index ["services_id"], name: "index_postings_on_services_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "amount"
    t.float "rating"
    t.text "description"
    t.text "date"
    t.integer "posting_id"
    t.index ["posting_id"], name: "index_reviews_on_posting_id"
  end

  create_table "service_providers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
