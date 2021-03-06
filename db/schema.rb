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

ActiveRecord::Schema.define(version: 20170123035004) do

  create_table "adminkeys", force: :cascade do |t|
    t.string   "rolename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string   "name"
    t.date     "applydeadline"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "introduction"
  end

  create_table "homeworkposts", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "homework_id"
    t.boolean  "handin",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.string   "title"
    t.string   "describe"
    t.integer  "classroom_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string   "topic"
    t.string   "content"
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.boolean  "readed",          default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "homeworkpost_id", default: 0
  end

  create_table "posts", force: :cascade do |t|
    t.string   "topic"
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "posttype_id"
  end

  create_table "posttypes", force: :cascade do |t|
    t.string   "typename"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "classroom_id", default: 0
  end

  create_table "userclassroomships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "classroom_id"
    t.boolean  "approved",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "userhomeworkships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "homework_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "adminkey_id",            default: 2
    t.string   "name"
    t.date     "birthday"
    t.string   "accountname"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
