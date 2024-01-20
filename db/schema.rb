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

ActiveRecord::Schema[7.0].define(version: 2024_01_20_205644) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "country_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string "director_fio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "film_countries", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_film_countries_on_country_id"
    t.index ["film_id"], name: "index_film_countries_on_film_id"
  end

  create_table "film_directors", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "director_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_film_directors_on_director_id"
    t.index ["film_id"], name: "index_film_directors_on_film_id"
  end

  create_table "film_genres", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_genres_on_film_id"
    t.index ["genre_id"], name: "index_film_genres_on_genre_id"
  end

  create_table "film_screenwriters", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "screenwriter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_screenwriters_on_film_id"
    t.index ["screenwriter_id"], name: "index_film_screenwriters_on_screenwriter_id"
  end

  create_table "film_speakers", force: :cascade do |t|
    t.bigint "film_id", null: false
    t.bigint "speaker_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["film_id"], name: "index_film_speakers_on_film_id"
    t.index ["speaker_id"], name: "index_film_speakers_on_speaker_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "film_name", null: false
    t.text "film_description", null: false
    t.date "release_date", null: false
    t.string "film_link"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "screenwriters", force: :cascade do |t|
    t.string "screenwriter_fio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "speakers", force: :cascade do |t|
    t.string "speaker_fio", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "film_countries", "countries"
  add_foreign_key "film_countries", "films"
  add_foreign_key "film_directors", "directors"
  add_foreign_key "film_directors", "films"
  add_foreign_key "film_genres", "films"
  add_foreign_key "film_genres", "genres"
  add_foreign_key "film_screenwriters", "films"
  add_foreign_key "film_screenwriters", "screenwriters"
  add_foreign_key "film_speakers", "films"
  add_foreign_key "film_speakers", "speakers"
end
