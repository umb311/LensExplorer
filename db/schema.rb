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

ActiveRecord::Schema[7.0].define(version: 2023_09_10_022131) do
  create_table "lens_tags", force: :cascade do |t|
    t.integer "lens_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lens_id", "tag_id"], name: "index_lens_tags_on_lens_id_and_tag_id", unique: true
    t.index ["lens_id"], name: "index_lens_tags_on_lens_id"
    t.index ["tag_id"], name: "index_lens_tags_on_tag_id"
  end

  create_table "lenses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "model_number"
    t.string "mount"
    t.boolean "lens_type"
    t.string "focal_length"
    t.integer "minimum_focusing_distance"
    t.integer "maximum_focusing_distance"
    t.string "aperture"
    t.float "maximum_aperture"
    t.float "minimum_aperture"
    t.integer "number_of_aperture_blades"
    t.string "angle_of_view"
    t.float "maximum_angle_of_view"
    t.float "minimum_angle_of_view"
    t.string "minimum_shooting_distance"
    t.float "minimum_shooting_distance_tele"
    t.float "minimum_shooting_distance_wide"
    t.string "lens_construction"
    t.string "maximum_magnification"
    t.string "filter_diameter"
    t.boolean "stabilization"
    t.boolean "teleconverter_14x"
    t.boolean "teleconverter_20x"
    t.string "dimensions"
    t.integer "weight"
    t.string "sensor_size"
    t.text "description"
    t.string "maker"
    t.string "grade"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "lens_tags", "lenses"
  add_foreign_key "lens_tags", "tags"
end
