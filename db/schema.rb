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

ActiveRecord::Schema.define(version: 2019_04_16_160724) do

  create_table "appointments", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeowners", force: :cascade do |t|
  end

  create_table "postings", force: :cascade do |t|
  end

  create_table "reviews", force: :cascade do |t|
  end

  create_table "service_providers", force: :cascade do |t|
    t.text "type"
    t.text "name"
    t.text "street_name"
    t.text "city"
    t.text "state"
    t.integer "zipcode"
    t.text "service_area"
    t.integer "years_in_service"
    t.float "average_rating"
    t.integer "services_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["services_id"], name: "index_service_providers_on_services_id"
  end

  create_table "services", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "service_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_provider_id"], name: "index_services_on_service_provider_id"
  end

end
