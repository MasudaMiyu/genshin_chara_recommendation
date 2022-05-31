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

ActiveRecord::Schema.define(version: 2022_05_30_074705) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "element"
    t.string "weapon"
    t.string "character_voice"
    t.string "has_heavy_past"
    t.string "gap_app_age"
    t.string "attack_or_support"
    t.string "would_betray"
    t.string "hot_female"
    t.string "ikemen"
    t.string "helpful"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "status"
    t.string "result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "progresses", force: :cascade do |t|
    t.integer "game_id"
    t.integer "sequence"
    t.integer "question_id"
    t.string "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.string "algorithm"
    t.string "eval_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
