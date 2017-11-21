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

ActiveRecord::Schema.define(version: 20171121162256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "continent"
    t.string   "airport_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "currency_name"
    t.string   "capital"
    t.string   "population"
    t.string   "national_dish"
    t.text     "travel_languages"
    t.string   "abbreviation"
    t.float    "avg_male_height"
    t.string   "calling_code"
    t.string   "capital_city"
    t.string   "currency_code"
    t.string   "elevation"
    t.string   "flag"
    t.string   "government_type"
    t.integer  "independence_date"
    t.integer  "iso"
    t.boolean  "landlocked"
    t.float    "life_expectancy"
    t.float    "population_density"
    t.float    "avg_temperature_in_celsius"
    t.string   "photo"
  end

  create_table "destinations", force: :cascade do |t|
    t.text     "notes"
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 2
    t.index ["country_id"], name: "index_destinations_on_country_id", using: :btree
    t.index ["user_id"], name: "index_destinations_on_user_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "country_id"
    t.index ["country_id"], name: "index_languages_on_country_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "country_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["country_id"], name: "index_reviews_on_country_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "token_expiry"
    t.date     "DOB"
    t.integer  "number_countries"
    t.integer  "years"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "destinations", "countries"
  add_foreign_key "destinations", "users"
  add_foreign_key "languages", "countries"
  add_foreign_key "reviews", "countries"
  add_foreign_key "reviews", "users"
end
