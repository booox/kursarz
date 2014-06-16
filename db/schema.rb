# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140616155154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "answers", force: true do |t|
    t.string   "content",     null: false
    t.integer  "question_id", null: false
    t.boolean  "correct",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_id"
  end

  create_table "assignment_submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.text     "output"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "code"
    t.boolean  "pending"
    t.integer  "status"
    t.integer  "course_id"
  end

  create_table "assignments", force: true do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.integer  "course_id"
    t.string   "screenshot_url"
    t.text     "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language"
    t.text     "example_solution"
    t.integer  "user_id"
    t.text     "sample_solution"
    t.integer  "total_score"
  end

  create_table "categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_categories", force: true do |t|
    t.integer  "course_id",   null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_roles", force: true do |t|
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
  end

  create_table "courses", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.integer  "user_id"
    t.text     "description"
    t.string   "screenshot_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description"
    t.string   "url"
  end

  create_table "lesson_shows", force: true do |t|
    t.integer "user_id"
    t.integer "lesson_id"
    t.integer "course_id"
  end

  create_table "lessons", force: true do |t|
    t.integer  "course_id",         null: false
    t.string   "name",              null: false
    t.text     "description",       null: false
    t.string   "screenshot_url"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_description"
    t.integer  "user_id"
  end

  create_table "questions", force: true do |t|
    t.string   "content",    null: false
    t.integer  "quiz_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_submissions", force: true do |t|
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quiz_id"
    t.integer  "user_id"
    t.hstore   "checked_answers"
    t.integer  "course_id"
  end

  create_table "quizzes", force: true do |t|
    t.string   "name",              null: false
    t.string   "short_description", null: false
    t.text     "description"
    t.integer  "course_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "screenshot_url"
  end

  create_table "users", force: true do |t|
    t.string   "login",                         null: false
    t.string   "name"
    t.string   "avatar_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "description"
    t.string   "website"
    t.string   "location"
    t.boolean  "admin",         default: false, null: false
    t.integer  "courses_limit"
  end

end
