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

ActiveRecord::Schema.define(version: 2020_03_05_163230) do

  create_table "cadets", force: :cascade do |t|
    t.integer "CWID"
    t.integer "CO_ID"
    t.string "F_NAME"
    t.string "M_INITIAL"
    t.string "L_NAME"
    t.integer "R_NUM"
    t.integer "P_NUM"
    t.string "EMAIL"
    t.string "RANK"
  end

  create_table "classes", force: :cascade do |t|
    t.integer "CLASS_ID"
    t.string "DAY"
    t.string "START_TIME"
    t.string "END_TIME"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "CO_ID"
    t.integer "LOCA_ID"
    t.string "CO_NAME"
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "ENROLL_ID"
    t.integer "CWID"
    t.string "class"
  end

  create_table "guard_assignments", force: :cascade do |t|
  end

  create_table "locations", force: :cascade do |t|
    t.integer "LOCA_ID"
    t.string "LOCA_NAME"
  end

  create_table "ranks", force: :cascade do |t|
    t.integer "RANK_ID"
    t.string "RANK_NAME"
    t.string "BOL_SWORD"
  end

end
