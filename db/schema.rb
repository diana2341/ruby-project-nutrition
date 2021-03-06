# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_22_224308) do

  create_table "foods", force: :cascade do |t|
    t.string "food_name"
    t.string "calories"
    t.string "carbs"
    t.string "fat"
  end

  create_table "nutritions", force: :cascade do |t|
    t.integer "food_id"
    t.integer "user_id"
    t.integer "amount"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "weight"
    t.integer "password"
  end

end
