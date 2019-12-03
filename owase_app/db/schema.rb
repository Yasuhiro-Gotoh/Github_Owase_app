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

ActiveRecord::Schema.define(version: 20191028044343) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "zissiYmd"
    t.string   "syasin1"
    t.string   "syasin2"
    t.text     "course1"
    t.text     "course2"
    t.text     "course3"
    t.text     "course4"
    t.text     "course5"
    t.text     "course6"
    t.text     "course7"
    t.text     "course8"
    t.text     "course9"
    t.text     "course10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "siryo"
  end

  create_table "eiyos", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "kirokuYmd"
    t.text     "eiyo1"
    t.text     "eiyo2"
    t.text     "eiyo3"
    t.text     "eiyo4"
    t.text     "eiyo5"
    t.text     "eiyo6"
    t.text     "eiyo7"
    t.text     "eiyo8"
    t.text     "eiyo9"
    t.text     "eiyo10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kihon_checks", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "kirokuYmd"
    t.string   "kihon1"
    t.string   "kihon2"
    t.string   "kihon3"
    t.string   "kihon4"
    t.string   "kihon5"
    t.string   "kihon6"
    t.string   "kihon7"
    t.string   "kihon8"
    t.string   "kihon9"
    t.string   "kihon10"
    t.string   "kihon11"
    t.string   "kihon12"
    t.string   "kihon13"
    t.string   "kihon14"
    t.string   "kihon15"
    t.string   "kihon16"
    t.string   "kihon17"
    t.string   "kihon18"
    t.string   "kihon19"
    t.string   "kihon20"
    t.string   "kihon21"
    t.string   "kihon22"
    t.string   "kihon23"
    t.string   "kihon24"
    t.string   "kihon25"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "koukous", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "kirokuYmd"
    t.text     "koukou1"
    t.text     "koukou2"
    t.text     "koukou3"
    t.text     "koukou4"
    t.text     "koukou5"
    t.text     "koukou6"
    t.text     "koukou7"
    t.text     "koukou8"
    t.text     "koukou9"
    t.text     "koukou10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nintis", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "kirokuYmd"
    t.text     "ninti1"
    t.text     "ninti2"
    t.text     "ninti3"
    t.text     "ninti4"
    t.text     "ninti5"
    t.text     "ninti6"
    t.text     "ninti7"
    t.text     "ninti8"
    t.text     "ninti9"
    t.text     "ninti10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riyosyas", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "simei"
    t.text     "birthYmd"
    t.text     "seibetsu"
    t.text     "zyusyo"
    t.text     "syasin"
    t.text     "tiku"
    t.text     "rireki"
    t.text     "kenko"
    t.text     "biko"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sankas", force: :cascade do |t|
    t.integer  "courseId"
    t.integer  "riyosyaId"
    t.string   "sankaFlg"
    t.text     "riyu"
    t.text     "biko"
    t.string   "vital1"
    t.string   "vital2"
    t.string   "vital3"
    t.string   "vital4"
    t.string   "vital5"
    t.string   "vital6"
    t.string   "vital7"
    t.string   "vital8"
    t.string   "vital9"
    t.string   "vital10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tairyokus", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "kirokuYmd"
    t.text     "tairyoku1"
    t.text     "tairyoku2"
    t.text     "tairyoku3"
    t.text     "tairyoku4"
    t.text     "tairyoku5"
    t.text     "tairyoku6"
    t.text     "tairyoku7"
    t.text     "tairyoku8"
    t.text     "tairyoku9"
    t.text     "tairyoku10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "undos", force: :cascade do |t|
    t.integer  "riyosyaId"
    t.text     "kirokuYmd"
    t.text     "undo1"
    t.text     "undo2"
    t.text     "undo3"
    t.text     "undo4"
    t.text     "undo5"
    t.text     "undo6"
    t.text     "undo7"
    t.text     "undo8"
    t.text     "undo9"
    t.text     "undo10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "mokuhyo"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "syozoku"
    t.string   "yuko"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
